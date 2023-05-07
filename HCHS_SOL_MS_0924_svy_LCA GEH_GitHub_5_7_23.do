***Analysis of the data for HCHS/SOL MS 0924
***by Larisa Tereshchenko <tereshl@ccf.org>
***May 2023
***use STATA 17
***

*** setup survey analysis:
svyset PSU_ID [pweight=WEIGHT_FINAL_NORM_OVERALL], strata(STRAT) vce(linearized) singleunit(missing)

***prevalence
svy linearized, subpop(included) : proportion i.PRECVD, over(Sex) percent
svy linearized, subpop(included) : proportion i.PRECVD, over(Hispanic) percent


***means (Table 1):
svy linearized, subpop(included) : mean aQRSTa aSVGaz aSVGel WilsonSVG_mVms SAIQRST RR_interval_ms , over(Hispanic)
svy linearized, subpop(included) : mean aQRSTa aSVGaz aSVGel WilsonSVG_mVms SAIQRST RR_interval_ms , over(Sex Hispanic)

***linear regression Table 2
svy linearized, subpop(included) : regress aQRSTa  i.Sex##i.PRECVD i.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Sex#PRECVD
marginsplot, recast (scatter) xdimension(Sex) xlabel(,) xscale(range(0.5 2.5))

svy linearized, subpop(included) : regress aSVGaz  i.Sex##i.PRECVD i.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Sex#PRECVD
marginsplot, recast (scatter) xdimension(Sex) xlabel(,) xscale(range(0.5 2.5))

svy linearized, subpop(included) : regress aSVGel  i.Sex##i.PRECVD i.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Sex#PRECVD
marginsplot, recast (scatter) xdimension(Sex) xlabel(,) xscale(range(0.5 2.5))


svy linearized, subpop(included) : regress WilsonSVG_mVms  i.Sex##i.PRECVD i.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Sex#PRECVD
marginsplot, recast (scatter) xdimension(Sex) xlabel(,) xscale(range(0.5 2.5))


svy linearized, subpop(included) : regress SAIQRST   i.Sex##i.PRECVD i.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Sex#PRECVD
marginsplot, recast (scatter) xdimension(Sex) xlabel(,) xscale(range(0.5 2.5))


svy linearized, subpop(included) : regress RR_interval_ms   i.Sex##i.PRECVD i.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat
margins Sex#PRECVD
marginsplot, recast (scatter) xdimension(Sex) xlabel(,) xscale(range(0.5 2.5))



***Table 3 linear regression
svy linearized, subpop(included) : regress aQRSTa  i.Sex i.PRECVD##ib3.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Hispanic
marginsplot, recast (scatter) xdimension(Hispanic) xlabel(,) xscale(range(0.5 2.5))

svy linearized, subpop(included) : regress aSVGaz  i.Sex i.PRECVD##ib3.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Hispanic
marginsplot, recast (scatter) xdimension(Hispanic) xlabel(,) xscale(range(0.5 2.5))

svy linearized, subpop(included) : regress aSVGel  i.Sex i.PRECVD##ib3.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Hispanic
marginsplot, recast (scatter) xdimension(Hispanic) xlabel(,) xscale(range(0.5 2.5))

svy linearized, subpop(included) : regress SAIQRST   i.Sex i.PRECVD##ib3.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Hispanic
marginsplot, recast (scatter) xdimension(Hispanic) xlabel(,) xscale(range(0.5 2.5))

svy linearized, subpop(included) : regress RR_interval_ms  i.Sex i.PRECVD##ib3.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Hispanic
marginsplot, recast (scatter) xdimension(Hispanic) xlabel(,) xscale(range(0.5 2.5))

svy linearized, subpop(included) : regress WilsonSVG_mVms  i.Sex i.PRECVD##ib3.Hispanic  i.EDUCATION_C4 i.AGEGROUP_C3  i.DIET_SCORE_JAMA_C2  i.HIGH_TOTAL_CHOL i.GPAQ_PAG2008YN i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2 i.BMI30  i.CIGARETTE_USE i.m3beat RR_interval_ms
margins Hispanic
marginsplot, recast (scatter) xdimension(Hispanic) xlabel(,) xscale(range(0.5 2.5))

***Figures 2 and 3
graph combine  adjaQRSTa_byHisp.gph  adjSVGaz_byHisp.gph   adjSVGel_byHisp.gph adjSVGmag_byHisp.gph  adjSAI_byHisp.gph  adjHR_byHisp.gph ,  imargin(1 1 1 1)  rows(2) cols(3) iscale(*.8)
graph combine  adjaQRSTa_bySex.gph  adjSVGaz_bySex.gph  adjSVGel_bySex.gph  adjSVGmag_bySex.gph  adjSAI_bySex.gph  adjHR_bySex.gph ,  imargin(1 1 1 1)  rows(2) cols(3) iscale(*.8)


****latent profile analysis multivariate model reported Suppl Table 2:

svy linearized, subpop(included) : gsem (aQRSTa aSVGaz aSVGel WilsonSVG_mVms SAIQRST <-i.Sex ib3.Hispanic i.AGEGROUP_C3 i.EDUCATION_C4 i.PRECVD i.CIGARETTE_USE i.HYPERTENSION_AHA_C5 i.DIABETES5 i.CKD_C2  i.HIGH_TOTAL_CHOL  i.BMI30 i.DIET_SCORE_JAMA_C2  i.GPAQ_PAG2008YN   i.m3beat c.RR_interval_ms), lclass(Class 3)
predict xb*
predict prob*, classposteriorpr
predict den*, density




***Fugure 4:
twoway (histogram aQRSTa if prob1>0.5 & prob2<=0.5 & prob3<=0.5, fcolor(lime%10) lcolor(green)) (histogram aQRSTa if prob2>0.5 & prob1<=0.5 & prob3<=0.5, fcolor(yellow%20) lcolor(gold)) (histogram aQRSTa if prob3>0.5 & prob1<=0.5 & prob2<=0.5, fcolor(red%10) lcolor(red))
sum xb1 xb6 xb11
twoway (histogram aSVGaz if prob1>0.5 & prob2<=0.5 & prob3<=0.5, fcolor(lime%10) lcolor(green)) (histogram aSVGaz if prob2>0.5 & prob1<=0.5 & prob3<=0.5, fcolor(yellow%20) lcolor(gold)) (histogram aSVGaz if prob3>0.5 & prob1<=0.5 & prob2<=0.5, fcolor(red%10) lcolor(red))
sum xb2 xb7 xb12
sum xb3 xb8 xb13
twoway (histogram aSVGel if prob1>0.5 & prob2<=0.5 & prob3<=0.5, fcolor(lime%10) lcolor(green)) (histogram aSVGel if prob2>0.5 & prob1<=0.5 & prob3<=0.5, fcolor(yellow%20) lcolor(gold)) (histogram aSVGel if prob3>0.5 & prob1<=0.5 & prob2<=0.5, fcolor(red%10) lcolor(red))
sum xb4 xb9 xb14
twoway (histogram WilsonSVG_mVms if prob1>0.5 & prob2<=0.5 & prob3<=0.5, fcolor(lime%10) lcolor(green)) (histogram WilsonSVG_mVms if prob2>0.5 & prob1<=0.5 & prob3<=0.5, fcolor(yellow%20) lcolor(gold)) (histogram WilsonSVG_mVms if prob3>0.5 & prob1<=0.5 & prob2<=0.5, fcolor(red%10) lcolor(red))
sum xb5 xb10 xb15
twoway (histogram SAIQRST if prob1>0.5 & prob2<=0.5 & prob3<=0.5, fcolor(lime%10) lcolor(green)) (histogram SAIQRST if prob2>0.5 & prob1<=0.5 & prob3<=0.5, fcolor(yellow%20) lcolor(gold)) (histogram SAIQRST if prob3>0.5 & prob1<=0.5 & prob2<=0.5, fcolor(red%10) lcolor(red))
twoway (histogram RR_interval_ms if prob1>0.5 & prob2<=0.5 & prob3<=0.5, fcolor(lime%10) lcolor(green)) (histogram RR_interval_ms if prob2>0.5 & prob1<=0.5 & prob3<=0.5, fcolor(yellow%20) lcolor(gold)) (histogram RR_interval_ms if prob3>0.5 & prob1<=0.5 & prob2<=0.5, fcolor(red%10) lcolor(red))
graph combine  aQRSTa_3LCA.gph   aSVGaz_3LCA.gph   aSVGel_3LCA.gph   SVGmag_3LCA.gph   SAI_3LCA.gph  RRint_3LCA.gph ,  imargin(1 1 1 1)  rows(2) cols(3) iscale(*.8)

svy linearized, subpop(included) : proportion i.ECG_MAJ, over(included)
svy linearized, subpop(included if prob1>0.5 & prob2<=0.5 & prob3<=0.5) : proportion i.ECG_MAJ, over(included)
svy linearized, subpop(included if prob2>0.5 & prob1<=0.5 & prob3<=0.5) : proportion i.ECG_MAJ, over(included)
svy linearized, subpop(included if prob3>0.5 & prob2<=0.5 & prob1<=0.5) : proportion i.ECG_MAJ, over(included)
svy linearized, subpop(included if prob1>0.5 & prob2<=0.5 & prob3<=0.5) : proportion i.ECG_MIN, over(included)
svy linearized, subpop(included if prob2>0.5 & prob1<=0.5 & prob3<=0.5) : proportion i.ECG_MIN, over(included)
svy linearized, subpop(included if prob3>0.5 & prob2<=0.5 & prob1<=0.5) : proportion i.ECG_MIN, over(included)
svy linearized, subpop(included if prob1>0.5 & prob2<=0.5 & prob3<=0.5) : proportion i.MI_ECG , over(included)
svy linearized, subpop(included if prob2>0.5 & prob1<=0.5 & prob3<=0.5) : proportion i.MI_ECG, over(included)
svy linearized, subpop(included if prob3>0.5 & prob2<=0.5 & prob1<=0.5) : proportion i.MI_ECG, over(included)
