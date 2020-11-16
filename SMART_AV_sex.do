***SMART AV data analysis
***code developed by Larisa Tereshchenko <tereshch@ohsu.edu>
***March-June 2020
***use Stata 16
***I acknowledge use of code developed by Schonlau and Zou for the random forests algorithm. 
***I acknowledge use of BRAIN Stata module to provide neural network [by Thorsten Doherr].
***see all citations in the manuscript or preprint


***define study outcome
gen response3 = 1 if reldif_lvesv <-0.15
recode response3 (.=0) if reldif_lvesv !=.
gen response4 = 1 if rel_lvesvi_diff <-0.15
recode response4 (.=0) if reldif_lvesv !=.
label variable response3 "more than 15% reduction in LVESV"
label variable response4 "more than 15% reduction in LVESVI"
clonevar compResp2 = compResp
recode compResp2 (1=0) if response4==0

***per guidelines
logit compResp2 qrs150 lbbb
predict guide, xb



****Table 1 unadjusted comparison by sex
ttest eGFRckdepi, by(female) unequal
ttest age, by(female) unequal
ttest lvef, by(female) unequal
tabulate white female, chi2 column
ttest weight, by(female) unequal
ttest height, by(female) unequal
ttest bmi, by(female) unequal
ttest bpsys, by(female) unequal
ttest bpdia, by(female) unequal
tabulate cm female, chi2 column
tabulate primary female, chi2 column
tabulate smk female, chi2 column
tabulate htn female, chi2 column
tabulate diabetes female, chi2 column
tabulate revasc  female, chi2 column
tabulate autoim  female, chi2 column
tabulate sleep  female, chi2 column
tabulate copd  female, chi2 column
tabulate cancer female, chi2 column
tabulate renal female, chi2 column
tabulate valve female, chi2 column
tabulate pm_ female, chi2 column
tabulate avb_any female, chi2 column
ttest pr, by(female) unequal
ttest qrs, by(female) unequal
tabulate conduction female, chi2 column
 tabulate lbbb female, chi2 column
 tabulate rbbb female, chi2 column
 tabulate ivcd female, chi2 column
ttest hrrest, by(female) unequal
tabulate NYHA female, chi2 column
ttest sixminutewalk, by(female) unequal
ttest qol, by(female) unequal
ttest potassium, by(female) unequal
ttest sodium, by(female) unequal
ttest crp, by(female) unequal
ranksum bnp, by(female)
by female, sort : summarize bnp, detail
sum bnp, det
tabulate spiro female, chi2 column
tabulate bb female, chi2 column
tabulate ace female, chi2 column
ttest lvesvi, by(female) unequal
gen lvedvi = lvedv/bsa
gen lvesdi=lvesd/bsa
gen lveddi=lvedd/bsa
ttest lvedvi, by(female) unequal
ttest lvesdi , by(female) unequal
ttest lveddi , by(female) unequal
tabulate RAO female, chi2 column
tab compResp2

logit compResp2 female, or

***matching balancing male and female characteristics (used in the 1st preprint version)
ebalance female c.age i.white i.cm i.primary i.smk i.htn i.diabetes i.avb_any i.conduction i.revasc i.valve i.cancer i.copd i.sleep_apnea i.renal c.bmi i.NYHA c.qrs c.pr i.bb i.ace_arb i.spiro c.eGFRckdepi c.sixminutewalk c.lvesvi c.lvedvi c.lvef c.qol c.lvesdi c.lveddi
svyset [pweight= _webal]
svy: logit compResp2 female, or

***augmented-inverse-probability-weighted (AIPW) estimator used for paper version November 2020 (causal inference: causal effect of sex on CRT response).
teffects aipw (compResp c.age i.white i.cm i.primary i.smk i.htn i.diabetes i.autoimm i.avb_any i.conduction i.revasc i.valve  i.cancer i.copd i.sleep_apnea i.renal c.bpdia c.bpsys i.NYHA c.qrs c.pr i.bb i.ace_arb  c.lvef c.bsa c.bmi c.lvedvi c.lvesdi c.lveddi c.lvesvi c.hrrest c.eGFRckdepi i.spiro, logit )(female c.age i.white i.cm i.primary i.smk i.htn i.diabetes i.autoimm i.avb_any i.conduction i.revasc i.valve  i.cancer i.copd i.sleep_apnea i.renal c.bpdia c.bpsys i.NYHA c.qrs c.pr i.bb i.ace_arb  c.lvef c.bsa c.bmi c.lvedvi c.lvesdi c.lveddi c.lvesvi c.hrrest c.eGFRckdepi i.spiro, logit ), pstolerance(1e-10)
di exp(-.1302377)
di exp(-.8953017)
di exp(.6348262)
tebalance overid

***ML
set seed 1234
splitsample, generate(sample) split(0.8 0.2 ) bal(female)  show


logit compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO if sample==1
estimates store ols
predict y_ols
calibrationbelt compResp2 y_ols, devel("external")

lasso logit compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO if sample==1, rseed(9693)
estimates store cv
predict y_cv
lassoinfo
lassoknots
lassocoef cv, display(coef)
cvplot
calibrationbelt compResp2 y_cv, devel("external")


lasso logit compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO if sample==1, selection(adaptive) rseed(9693)
estimates store adaptive
predict y_adaptive
lassoknots
lassocoef adaptive, display(coef)
cvplot
calibrationbelt compResp2 y_adaptive, devel("external")
estimates restore adaptive
coefpath, lineopts(lwidth(thick)) legend(on position(3) cols(1)) xsize(4.2)


lasso logit compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO if sample==1, selection(plugin) rseed(9693)
estimates store plugin
predict y_plugin, postselection
lassoknots
lassocoef plugin, display(coef, post)
calibrationbelt compResp2 y_plugin, devel("external")


elasticnet logit compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO if sample==1, alpha(0.25 0.5 0.75) rseed(9693)
estimates store enet
predict y_enet
lassoinfo
lassoknots
lassocoef enet, display(coef)
cvplot
calibrationbelt compResp2 y_enet, devel("external")

elasticnet logit compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO if sample==1, alpha(0) rseed(9693)
estimates store ridge
predict y_ridge
lassoknots
lassocoef ridge, display(coef)
cvplot
calibrationbelt compResp2 y_ridge, devel("external")

lassogof ols cv adaptive plugin enet ridge if sample==2
lassogof ols cv adaptive plugin enet ridge if sample==2 , postselection

roccomp compResp2 y_plugin y_enet y_cv y_adaptive y_ols y_ridge guide if sample==2
roccomp compResp2  y_adaptive  guide if sample==2
roccomp compResp2 y_enet y_cv y_adaptive y_ols y_ridge  if sample==2
roccomp compResp2 y_plugin  guide if sample==2
roctab compResp2 y_adaptive, detail graph summary
roccomp compResp2 y_adaptive y_plugin  guide,  graph summary

****CNN 
help brain

brain define, input(age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO) output(compResp2) hidden(20)
brain train if sample==1, iter(500) eta(2)
brain think yCNN
roctab compResp2 yCNN if sample==2, summary
roctab compResp2 yCNN if sample==1, summary

***calibration of CNN model is performed on the whole population (samples 1+2)
***re-train your model for the whole population
hl compResp2 yCNN
egen decyCNN=cut( yCNN ), at(0(0.1)1)
hl compResp2 yCNN , q(decyCNN) plot

***random forests 
*** step 1. figure out how large the value of iterations() need to be

set seed 1234
generate u = uniform()
sort u, stable

generate out_of_bag_error1 = .
generate validation_error = .
generate iter1 = .
local j = 0
forvalues i = 10(5)500 {
 local j = `j' + 1
rforest compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO  if sample==1, type(class) iterations(`i') numvars(1)
 quietly replace iter1 = `i' in `j'
 quietly replace out_of_bag_error1 = `e(OOB_Error)' in `j'
 predict p if sample==2
 quietly replace validation_error = `e(error_rate)' in `j'
 drop p
 }

label variable out_of_bag_error1 "Out-of-bag error"
label variable iter1 "Iterations"
label variable validation_error "Validation error"
twoway (scatter out_of_bag_error1 iter1, sort mcolor(blue) msize(tiny)) (scatter validation_error iter1, sort mcolor(red) msize(tiny))


****step 2. tune the hyperparameter numvars
generate oob_error = .
generate nvars = .
generate val_error = .
local j = 0
forvalues i = 1(1)26 {
 local j = `j' + 1
rforest compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO  if sample==1, type(class) iterations(500) numvars(`i')
 quietly replace nvars = `i' in `j'
 quietly replace oob_error = `e(OOB_Error)' in `j'
 predict p if sample==2
quietly replace val_error = `e(error_rate)' in `j'
 drop p
 }
 label variable oob_error "Out-of-bag error"
 label variable val_error "Validation error"
 label variable nvars "Number of variables randomly selected at each split"
twoway (scatter oob_error nvars, sort mcolor(blue) msize(tiny)) (scatter val_error nvars, sort mcolor(red) msize(tiny))

***find number of variables with min error
frame put val_error nvars, into(mydata)
 frame mydata {
 sort val_error, stable
 local min_val_err = val_error[1]
 local min_nvars = nvars[1]
 }
 frame drop mydata
display "Minimum Error: `min_val_err'; Corresponding number of variables `min_nvars''"

***final random forests model
rforest compResp2 age female white cm primary smk htn diabetes autoimm avb_any  conduction revasc valve pm_implant cancer copd sleep_apnea renal weight_kg height_cm bmi bpsys bpdia hrrest NYHA qrs pr bb ace_arb eGFRckdepi  sixminutewalk potassium sodium  crp bnp qol lvesvi lvedvi lvesdi lveddi lvef spiro RAO  if sample==1, type(class) iterations(500) numvars(7)

display e(OOB_Error)
predict prf if sample==2
display e(error_rate)

predict prf1 if sample==1

***variable importance plot
matrix importance = e(importance)
svmat importance
generate importid=""
 local mynames: rownames importance
 local k: word count `mynames'
 if `k'>_N {
 set obs `k'
 }
 forvalues i = 1(1)`k' {
 local aword: word `i' of `mynames'
 local alabel: variable label `aword'
 if ("`alabel''"!="") qui replace importid= "`alabel''" in `i'
 else qui replace importid= "`aword''" in `i'
 }

graph hbar (mean) importance , over(importid, sort(1) label(labsize(2))) ytitle(Importance)

logit compResp2 lbbb_qrs150
predict guide, p
roccomp compResp2 prf guide if sample==2

graph combine rforest_iterations.gph rforest_nvars.gph  , ycomm imargin(1 1 1 1)  rows(1) cols(2)
graph combine cvplot_cv_all.gph  cvplot_adaptive_all.gph  cvplot_enet_all.gph cvplot_ridge_all.gph,  ycomm imargin(1 1 1 1)  rows(2) cols(2) iscale(*.8)

***plot odds ratio for quantiles of predicted probabilities by adaptive lasso 
xtile q5y_adaptive = y_adaptive, nquantiles(5)
logit compResp2 i.q5y_adaptive, or
coefplot, drop(_cons) base xline(1) eform xtitle(Odds ratio)

