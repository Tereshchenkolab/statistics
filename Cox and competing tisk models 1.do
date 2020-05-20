*** generate standardized exposure variables for all 9 variables, in all participants together
sum QRS_TmV1 
gen z_QRS_TV1 = (QRS_TmV1 - r(mean))/r(sd)
sum SVGelV1
gen z_SVGelV1 = (SVGelV1 - r(mean))/r(sd)
sum SVGmagV1
gen z_SVGmagV1 = (SVGmagV1 - r(mean))/r(sd)
sum SAI_QRSTV1
gen z_SAIV1 = (SAI_QRSTV1 - r(mean))/r(sd)
sum pQRS_TaV1
gen z_pQRS_TV1 = (pQRS_TaV1 - r(mean))/r(sd)
sum pSVGelV1
gen z_pSVGelV1 = ( pSVGelV1 - r(mean))/r(sd)
sum pSVGmagV1
gen z_pSVGmagV1 = (pSVGmagV1 - r(mean))/r(sd)
sum trSVGazV1
gen z_trSVGazV1 = (trSVGazV1 - r(mean))/r(sd)
sum trpSVGazV1
gen z_trpSVGazV1 = (trpSVGazV1 - r(mean))/r(sd)
sum CornellvolV1
gen z_CornellvolV1 = (CornellvolV1 - r(mean))/r(sd)
sum vrateV1
gen z_vrateV1 = (vrateV1 - r(mean))/r(sd)
sum qrsdV1
gen z_qrsdV1 = (qrsdV1 - r(mean))/r(sd)
sum qtcV1
gen z_qtcV1 = (qtcV1 - r(mean))/r(sd)





gen bmicatV1 = 1 if bmiV1<18.5
recode bmicatV1 (.=2) if bmiV1>=18.5 & bmiV1 <25
recode bmicatV1 (.=3) if bmiV1>=25 & bmiV1 <30
recode bmicatV1 (.=4)
gen bmicatV2 = 1 if bmiV2<18.5
recode bmicatV2 (.=2) if bmiV2>=18.5 & bmiV2 <25
recode bmicatV2 (.=3) if bmiV2>=25 & bmiV2 <30
recode bmicatV2 (.=4)
gen bmicatV3 = 1 if bmiV3<18.5
recode bmicatV3 (.=2) if bmiV3>=18.5 & bmiV3 <25
recode bmicatV3 (.=3) if bmiV3>=25 & bmiV3 <30
recode bmicatV3 (.=4)
gen bmicatV4 = 1 if bmiV4<18.5
recode bmicatV4 (.=2) if bmiV4>=18.5 & bmiV4 <25
recode bmicatV4 (.=3) if bmiV4>=25 & bmiV4 <30
recode bmicatV4 (.=4)

***define outcome and calculate incidence
*** compdeath==3 is SCD; =2 is nonsudden CV death; =1 is noncardiac
tab compdeath
stset ttdeath_y, id(id_n) failure(compdeath==3) scale(1)
stptime, per(1000)
sum ttdeath_y, det
stptime if female==0, per(1000)
stptime if female==1, per(1000)
stset ttdeath_y, id(id_n) failure(compdeath==2) scale(1)
stptime, per(1000)
stptime if female==0, per(1000)
stptime if female==1, per(1000)
stset ttdeath_y, id(id_n) failure(compdeath==1) scale(1)
stptime, per(1000)
stptime if female==0, per(1000)
stptime if female==1, per(1000)

****Cox models 1 testing interaction with sex; ended up including bmicatV1 in all models
***made race*place interaction term that helps with PH


stcox c.z_QRS_TV1##i.female i.bmicatV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

stcox c.z_pQRS_TV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det
margins female, at(z_pQRS_TV1=(-2 -1 0 1 2 3)) plot

stcox c.z_pSVGelV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

stcox c.z_SVGelV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

stcox c.z_trpSVGazV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

stcox c.z_trSVGazV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

***note: PH assumption for SAI model is met if there is no sex-interaction term. Reported model for All does not include interaction with sex term:
stcox c.z_SAIV1 i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1 i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det
***P-value for interaction is reported from the model that included sex-interaction term. PH assumption for SAI in this model is not met.
stcox c.z_SAIV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1 i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

sum z_SAIV1, det
margins female, at(z_SAIV1=(-1 0 1 2 3)) plot

stcox c.z_pSVGmagV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 i.ecgLVHV1 i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det
sum z_pSVGmagV1, det
margins female, at(z_pSVGmagV1 =(-2 -1 0 1 2)) plot

stcox c.z_SVGmagV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1 i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

****model for Cornell voltage was not adjusted for binary variable ECG-LVH to avoid collinearity
stcox c.Z_CornellvolV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

stcox c.z_vrateV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

stcox c.z_qrsdV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det

stcox c.z_qtcV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2
estat phtest, det


***stratified Cox models for males and females 
stcox c.z_QRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0
estat phtest, det
stcox c.z_QRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1 i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0
estat phtest, det
stcox c.z_pQRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1
estat phtest, det

stcox c.z_pSVGelV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0
estat phtest, det
stcox c.z_pSVGelV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1
estat phtest, det

stcox c.z_SVGelV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0
estat phtest, det
stcox c.z_SVGelV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1
estat phtest, det

stcox c.z_trpSVGazV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0
estat phtest, det
stcox c.z_trpSVGazV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1
estat phtest, det

stcox c.z_trSVGazV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0
estat phtest, det
stcox c.z_trSVGazV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1
estat phtest, det

***note: model for SAI in males: PH was not met; all attempts to fix PH by adding interaction terms with race or race_place failed. Left as is; 
stcox c.z_SAIV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==0
estat phtest, det
stcox c.z_SAIV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==1
estat phtest, det

stcox c.z_pSVGmagV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==0
estat phtest, det
stcox c.z_pSVGmagV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==1
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1 i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==0
estat phtest, det
stcox c.z_SVGmagV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==1
estat phtest, det

stcox c.z_vrateV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==0
estat phtest, det
stcox c.z_vrateV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==1
estat phtest, det

stcox c.z_qrsdV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==0
estat phtest, det
stcox c.z_qrsdV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==1
estat phtest, det

stcox c.z_qtcV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==0
estat phtest, det
stcox c.z_qtcV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==1
estat phtest, det
*****Models for Cornell voltage were not adjusted for binary variable ECG-LVH to avoid collinearity
stcox c.Z_CornellvolV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1    i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==0
estat phtest, det
stcox c.Z_CornellvolV1 c.ageV1 i.race_place  i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1    i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 i.bmicatV1 if female==1
estat phtest, det


***competing risk models 1 for SCD
stcrreg c.z_QRS_TV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_pQRS_TV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_SVGelV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1 i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_pSVGelV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2, compete(compdeath==1 2)
stcrreg c.z_trSVGazV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_trpSVGazV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_pSVGmagV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_SVGmagV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_SAIV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.Z_CornellvolV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_vrateV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_qrsdV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)
stcrreg c.z_qtcV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 2)






***COMPETING RISK MODELS 1 for SCD STRATIFIED BY SEX

stcrreg c.z_QRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_QRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_pQRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_SVGelV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_SVGelV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_pSVGelV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_pSVGelV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_trSVGazV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_trSVGazV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_trpSVGazV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_trpSVGazV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_pSVGmagV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_SVGmagV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_SAIV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_SAIV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.Z_CornellvolV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.Z_CornellvolV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_vrateV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_vrateV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_qrsdV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_qrsdV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)

stcrreg c.z_qtcV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 2)
stcrreg c.z_qtcV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 2)






***competing risk models for non-sudden cardiovascular death
stcrreg c.z_QRS_TV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_pQRS_TV1##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_SVGelV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_pSVGelV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2, compete(compdeath==1 3)
stcrreg c.z_trSVGazV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_trpSVGazV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_pSVGmagV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_SVGmagV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_SAIV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.Z_CornellvolV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_vrateV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_qrsdV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)
stcrreg c.z_qtcV1##i.female  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 , compete(compdeath==1 3)




***COMPETING RISK MODELS for non-sudden cardiovasc death STRATIFIED BY SEX

stcrreg c.z_QRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_QRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_pQRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_pQRS_TV1 c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_SVGelV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_SVGelV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_pSVGelV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_pSVGelV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_trSVGazV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_trSVGazV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_trpSVGazV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_trpSVGazV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_pSVGmagV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_pSVGmagV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_SVGmagV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_SVGmagV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_SAIV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_SAIV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.Z_CornellvolV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.Z_CornellvolV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_vrateV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_vrateV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_qrsdV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_qrsdV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)

stcrreg c.z_qtcV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==0, compete(compdeath==1 3)
stcrreg c.z_qtcV1  c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.ecgLVHV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 if female==1, compete(compdeath==1 3)
