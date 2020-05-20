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
stptime if black==0, per(1000)
stptime if black==1, per(1000)


stset ttdeath_y, id(id_n) failure(compdeath==2) scale(1)
stptime, per(1000)
stptime if black==0, per(1000)
stptime if black==1, per(1000)
stset ttdeath_y, id(id_n) failure(compdeath==1) scale(1)
stptime, per(1000)
stptime if black==0, per(1000)
stptime if black==1, per(1000)

****Cox models 1 testing interaction with race; 
*** grouped categoical variables: bmicatV1; lessHS = education less than high school; placecat = Minnesota center vs all others; income_cat = income < or >= 25000 

stcox c.z_QRS_TV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_pQRS_TV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_pSVGelV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_SVGelV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_trpSVGazV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_trSVGazV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_SAIV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_pSVGmagV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_SVGmagV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_CornellvolV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_vrateV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_qtcV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det

stcox c.z_qrsdV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1
estat phtest, det



***stratified Cox models for black and white
***for white

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_pSVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_SVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_trpSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_trSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_vrateV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_qtcV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

stcox c.z_qrsdV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0
estat phtest, det

****for black


stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_pSVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_SVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_trpSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_trSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_vrateV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_qtcV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det

stcox c.z_qrsdV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1
estat phtest, det


***competing risk models for SCD (model 1 adjusted for baseline risk factors)
***define outcome 
*** compdeath==3 is SCD; =2 is nonsudden CV death; =1 is noncardiac
tab compdeath
stset ttdeath_y, id(id_n) failure(compdeath==3) scale(1)

stcrreg c.z_QRS_TV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_pSVGelV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_SVGelV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_trpSVGazV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_trSVGazV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_SAIV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_pSVGmagV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_SVGmagV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_CornellvolV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_vrateV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_qtcV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)


stcrreg c.z_qrsdV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)



****competing risk of SCD stratified - for  whites

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_pSVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_SVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_trpSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_trSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_vrateV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_qtcV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


stcrreg c.z_qrsdV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 2)


***for blacks

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_pSVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_SVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_trpSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_trSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_vrateV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_qtcV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)


stcrreg c.z_qrsdV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 2)

***competing risk models for nonSCD (model 1 adjusted for baseline risk factors)
***define outcome 
*** compdeath==3 is SCD; =2 is nonsudden CV death; =1 is noncardiac
tab compdeath
stset ttdeath_y, id(id_n) failure(compdeath==2) scale(1)

stcrreg c.z_QRS_TV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_pQRS_TV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_pSVGelV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_SVGelV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_trpSVGazV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_trSVGazV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_SAIV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_pSVGmagV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_SVGmagV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_CornellvolV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_vrateV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_qtcV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


stcrreg c.z_qrsdV1##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)



****competing risk of nonSCD stratified - for  whites

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_pSVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_SVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_trpSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_trSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_vrateV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_qtcV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


stcrreg c.z_qrsdV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==0, compete(compdeath==1 3)


***for competing risk of nonSCD blacks

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_pSVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_SVGelV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_trpSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_trSVGazV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_vrateV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_qtcV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


stcrreg c.z_qrsdV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if black==1, compete(compdeath==1 3)


****interaction with both race and HTN Cox model 1

gen raceHTN = 0 if black==0 & htnV1==0
recode raceHTN (.=1) if black==0 & htnV1==1
recode raceHTN (.=2) if black==1 & htnV1==1
recode raceHTN (.=3) if black==1 & htnV1==0
tab raceHTN, mis



stcox c.z_pSVGmagV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_SVGmagV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_QRS_TV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_pQRS_TV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det


stcox c.z_SAIV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_CornellvolV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det






***competing risk of SCD for both race and hypertension categories

stcrreg c.z_QRS_TV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_SAIV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)






***competing risk of nonSCD for both race and hypertension categories
stset ttdeath_y, id(id_n) failure(compdeath==2) scale(1)

stcrreg c.z_QRS_TV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_pQRS_TV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_SVGmagV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_pSVGmagV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_SAIV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_CornellvolV1##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)






****interaction by both prevalent CHD and raceHTN
gen raceCHD = 0 if black==0 & chdV1==0
recode raceCHD (.=1) if black==0 & chdV1==1
recode raceCHD (.=2) if black==1 & chdV1==1
recode raceCHD (.=3) if black==1 & chdV1==0
tab raceCHD, mis


stcox c.z_pSVGmagV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_SVGmagV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_QRS_TV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_pQRS_TV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det


stcox c.z_CornellvolV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det


stcox c.z_SAIV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det




tab bmicatV1
clonevar bmicat = bmicatV1
recode bmicat (2=1) (3=2) (4=3)
tab bmicat

gen raceBMI = 0 if black==0 & bmicat==1
recode raceBMI (.=1) if black==0 & bmicat==2
recode raceBMI (.=2) if black==0 & bmicat==3
recode raceBMI (.=3) if black==1 & bmicat==1
recode raceBMI (.=4) if black==1 & bmicat==2
recode raceBMI (.=5) if black==1 & bmicat==3
tab raceBMI, mis



stcox c.z_pSVGmagV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_SVGmagV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_QRS_TV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_pQRS_TV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_SAIV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

stcox c.z_CornellvolV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 
estat phtest, det

sts graph, cumhaz by(raceHTN) ci
sts graph, cumhaz by(raceCHD) ci
sts graph, cumhaz by(raceBMI) ci
strate raceCHD, graph
strate raceHTN, graph
strate raceBMI, graph



***competing risk of SCD for both race and CHD categories

stcrreg c.z_QRS_TV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_SAIV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)




***competing risk of nonSCD for both race and CHD categories
stset ttdeath_y, id(id_n) failure(compdeath==2) scale(1)

stcrreg c.z_QRS_TV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_pQRS_TV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_SVGmagV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_pSVGmagV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_SAIV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_CornellvolV1##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)



***competing risk of SCD for both race and BMI categories

stcrreg c.z_QRS_TV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_SAIV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 2)




***competing risk of nonSCD for both race and BMI categories
stset ttdeath_y, id(id_n) failure(compdeath==2) scale(1)

stcrreg c.z_QRS_TV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_pQRS_TV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_SVGmagV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_pSVGmagV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_SAIV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)

stcrreg c.z_CornellvolV1##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1, compete(compdeath==1 3)


****Cox subgroups two-way interactions stratified analyses by raceCHD

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0
estat phtest, det


stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1
estat phtest, det


stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2
estat phtest, det


stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3
estat phtest, det



stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3
estat phtest, det



stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3
estat phtest, det




stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3
estat phtest, det




stcox c.z_CornellvolV c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0
estat phtest, det

stcox c.z_CornellvolV c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1
estat phtest, det

stcox c.z_CornellvolV c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2
estat phtest, det

stcox c.z_CornellvolV c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3
estat phtest, det


stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3
estat phtest, det



****Cox subgroups two-way interactions stratified analyses by raceHTN

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0
estat phtest, det


stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1
estat phtest, det


stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2
estat phtest, det


stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3
estat phtest, det



stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3
estat phtest, det



stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3
estat phtest, det




stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3
estat phtest, det




stcox c.z_CornellvolV c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0
estat phtest, det

stcox c.z_CornellvolV c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1
estat phtest, det

stcox c.z_CornellvolV c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2
estat phtest, det

stcox c.z_CornellvolV c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3
estat phtest, det


stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3
estat phtest, det

***cox model 1 subgroups by bmi

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0
estat phtest, det

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1
estat phtest, det

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2
estat phtest, det

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3
estat phtest, det

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4
estat phtest, det

stcox c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0 
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1 
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2 
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3 
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4 
estat phtest, det

stcox c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5 
estat phtest, det


stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4
estat phtest, det

stcox c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5
estat phtest, det


stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4
estat phtest, det

stcox c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5
estat phtest, det


stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4
estat phtest, det

stcox c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5
estat phtest, det

stcox c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0
estat phtest, det

stcox c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1
estat phtest, det

stcox c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2
estat phtest, det

stcox c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3
estat phtest, det

stcox c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4
estat phtest, det

stcox c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5
estat phtest, det



***competing risk of SCD for race-BMI subgroups.

***competing risk of SCD for both race and BMI categories, stratified

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0, compete(compdeath==1 2)


stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5, compete(compdeath==1 2)




stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5, compete(compdeath==1 2)


stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5, compete(compdeath==1 2)




stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5, compete(compdeath==1 2)


stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5, compete(compdeath==1 2)


stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==0, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==1, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==2, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==3, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==4, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceBMI==5, compete(compdeath==1 2)

***competing risk of SCD for race-LVH subgroups (addition for R1).

***competing risk of SCD for both race and LVH categories, stratified

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==0, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==1, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==2, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceHTN==3, compete(compdeath==1 2)


***competing risk of SCD for both race and CHD categories, stratified
***note: use bmicat instead of bmicatV1 with raceCHD==1 (otherwise do not converge)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2, compete(compdeath==1 2)

stcrreg c.z_QRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2, compete(compdeath==1 2)

stcrreg c.z_pQRS_TV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2, compete(compdeath==1 2)

stcrreg c.z_SVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2, compete(compdeath==1 2)

stcrreg c.z_pSVGmagV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2, compete(compdeath==1 2)

stcrreg c.z_SAIV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==0, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==1, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==2, compete(compdeath==1 2)

stcrreg c.z_CornellvolV1 c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 c.vrateV1 c.qrsdV1 c.qtcV1 c.CornellvolV1 i.lessHS i.occupV1 i.income_cat i.insurV1 if raceCHD==3, compete(compdeath==1 2)



