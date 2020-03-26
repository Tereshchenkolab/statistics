***STATA code developed by Larisa Tereshchenko <tereshch@ohsu.edu> 
***for analysis of the JHS approved manuscript proposal P1224
***January 2020
***use STATA 16

set seed 123456789
splitsample , generate(sample) split(0.6 0.2 0.2)
label values sample lbsample
label define lbsample 1 "Training" 2 "Testing"  3"Validation", replace
tab sample


***Transformation of azimuth variables 
gen traSVGaz = (areasvgazimuth_deg*2)+360
gen trpSVGaz = (peaksvgazimuth_deg*2)+360
gen traQRSaz = (areaqrsazimuth_deg*2)+360
gen trpQRSaz = (peakqrsazimuth_deg*2)+360
gen traTaz = (areatazimuth_deg*2)+360
gen trpTaz = (peaktazimuth_deg*2)+360



***compare characteristics of participants in three sub-samples
oneway age sample, tabulate
tabulate male sample, chi2 column
oneway weight sample, tabulate
oneway height sample, tabulate
oneway BMI sample, tabulate
oneway bsa sample, tabulate
oneway BMI3cat sample, tabulate
tabulate BMI3cat sample, chi2 column
tabulate everSmoker sample, chi2 column
tabulate HTN sample, chi2 column
oneway sbp sample, tabulate
oneway dbp sample, tabulate
oneway ecgHR sample, tabulate
oneway QRS sample, tabulate
oneway QT sample, tabulate
oneway QTcBaz sample, tabulate
oneway QTcFram sample, tabulate
oneway QTcHod sample, tabulate
oneway QTcFrid sample, tabulate
oneway CV sample, tabulate
tabulate mbeat3 sample, chi2 column
oneway areaqrs_uvms sample, tabulate
oneway peakqrsmagnitude_uv sample, tabulate
oneway areaqrselevation_deg sample, tabulate
oneway peakqrselevation_deg sample, tabulate
oneway areat_uvms sample, tabulate
oneway peaktmagnitude_uv sample, tabulate
oneway areatelevation_deg sample, tabulate
oneway peaktelevation_deg sample, tabulate
oneway wilsonsvg_uvms sample, tabulate
oneway peaksvgmagnitude_uv sample, tabulate
oneway areasvgelevation_deg sample, tabulate
oneway peaksvgelevation_deg sample, tabulate
oneway saiqrst sample, tabulate
oneway aucofqtvectormagnitude_uvms sample, tabulate
oneway areaqrstangle_deg sample, tabulate
oneway peakqrstangle_deg sample, tabulate

circwwm areaqrsazimuth_deg , by(sample)
circcomp areaqrsazimuth_deg , by(sample) detail
circcomp areaqrsazimuth_deg, detail

circwwm peakqrsazimuth_deg , by(sample)
circcomp peakqrsazimuth_deg , by(sample) detail
circcomp peakqrsazimuth_deg ,  detail

circwwm areatazimuth_deg , by(sample)
circcomp areatazimuth_deg , by(sample) detail
circcomp areatazimuth_deg ,  detail
di 314.4-360

circwwm peaktazimuth_deg , by(sample)
circcomp peaktazimuth_deg , by(sample) detail
circcomp peaktazimuth_deg ,  detail

circwwm areasvgazimuth_deg , by(sample)
circcomp areasvgazimuth_deg , by(sample) detail
circcomp areasvgazimuth_deg ,  detail

circwwm peaksvgazimuth_deg , by(sample)
circcomp peaksvgazimuth_deg , by(sample) detail
circcomp peaksvgazimuth_deg ,  detail

circwwm areaqrstangle_deg , by(sample)
circcomp areaqrstangle_deg , by(sample) detail
circcomp areaqrstangle_deg , detail
circwwm peakqrstangle_deg , by(sample)
circcomp peakqrstangle_deg , by(sample) detail
circcomp peakqrstangle_deg ,  detail
circwwm areasvgelevation_deg , by(sample)
circcomp areasvgelevation_deg , by(sample) detail
circcomp areasvgelevation_deg ,  detail
circwwm peaksvgelevation_deg , by(sample)
circcomp peaksvgelevation_deg , by(sample) detail
circcomp peaksvgelevation_deg ,  detail
circwwm areatelevation_deg , by(sample)
circcomp areatelevation_deg , by(sample) detail
circcomp areatelevation_deg ,  detail
circwwm peaktelevation_deg , by(sample)
circcomp peaktelevation_deg , by(sample) detail
circcomp peaktelevation_deg ,  detail
circwwm areaqrselevation_deg , by(sample)
circcomp areaqrselevation_deg , by(sample) detail
circcomp areaqrselevation_deg ,  detail
circwwm peakqrselevation_deg , by(sample)
circcomp peakqrselevation_deg , by(sample) detail
circcomp peakqrselevation_deg ,  detail
tabulate CVD sample, chi2 column



***step one: development or training in sample 1

logit CVD age male weight height bsa BMI BMI3cat sbp dbp HTN everSmoker ecgHR QRS QT QTcFram QTcBaz QTcHod QTcFrid CV mbeat3 peakqrstangle_deg areaqrstangle_deg peakqrselevation_deg - saiqrst  traSVGaz - trpTaz if sample==1
estimates store ols
predict y_ols

lasso logit CVD age male weight height bsa BMI BMI3cat sbp dbp HTN everSmoker ecgHR QRS QT QTcFram QTcBaz QTcHod QTcFrid CV mbeat3 peakqrstangle_deg areaqrstangle_deg peakqrselevation_deg - saiqrst  traSVGaz - trpTaz if sample==1, rseed(123456789)
estimates store cv
predict y_cv

lasso logit CVD age male weight height bsa BMI BMI3cat sbp dbp HTN everSmoker ecgHR QRS QT QTcFram QTcBaz QTcHod QTcFrid CV mbeat3 peakqrstangle_deg areaqrstangle_deg peakqrselevation_deg - saiqrst  traSVGaz - trpTaz if sample==1, selection(adaptive) rseed(123456789)
estimates store adaptive
predict y_adaptive

lasso logit CVD age male weight height bsa BMI BMI3cat sbp dbp HTN everSmoker ecgHR QRS QT QTcFram QTcBaz QTcHod QTcFrid CV mbeat3 peakqrstangle_deg areaqrstangle_deg peakqrselevation_deg - saiqrst  traSVGaz - trpTaz if sample==1, selection(plugin) rseed(123456789)
estimates store plugin
predict y_plugin, postselection

elasticnet logit CVD age male weight height bsa BMI BMI3cat sbp dbp HTN everSmoker ecgHR QRS QT QTcFram QTcBaz QTcHod QTcFrid CV mbeat3 peakqrstangle_deg areaqrstangle_deg peakqrselevation_deg - saiqrst  traSVGaz - trpTaz if sample==1, alpha(0.25 0.5 0.75) rseed(123456789)
estimates store enet
predict y_enet

elasticnet logit CVD age male weight height bsa BMI BMI3cat sbp dbp HTN everSmoker ecgHR QRS QT QTcFram QTcBaz QTcHod QTcFrid CV mbeat3 peakqrstangle_deg areaqrstangle_deg peakqrselevation_deg - saiqrst  traSVGaz - trpTaz if sample==1, alpha(0) rseed(123456789)
estimates store ridge
predict y_ridge

lassogof ols cv adaptive plugin enet ridge if sample==2
lassogof ols cv adaptive plugin enet ridge if sample==2 , postselection

*** postselection  plugin has the smallest deviance and the largest deviance ratio 

estimates restore enet
predict y_enet
roctab CVD y_enet if sample==3, summary
lassoinfo
lassoknots
cvplot
lassocoef enet, display(coef)

estimates restore ols
predict y_ols
roctab CVD y_ols if sample==3, summary
lassoinfo
lassoknots
cvplot


estimates restore cv
predict y_cv
roctab CVD y_cv if sample==3, summary
lassoinfo
lassoknots
lassocoef cv, display(coef)
cvplot

estimates restore adaptive
predict y_adaptive
roctab CVD y_adaptive if sample==3, summary
**lassoinfo
lassoknots
lassocoef adaptive, display(coef)
cvplot

estimates restore plugin
predict y_plugin, postselection
roctab CVD y_plugin if sample==3, summary
lassoinfo
lassoknots
lassocoef plugin, display(coef, post)


estimates restore ridge
predict y_ridge
roctab CVD y_ridge if sample==3, plot summary
lassoinfo
lassoknots
cvplot
lassocoef ridge, display(coef)

roccomp CVD y_plugin y_enet y_cv y_adaptive y_ols y_ridge if sample==3


