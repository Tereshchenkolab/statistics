***Analysis of the data for ARIC MS 3292
***by Larisa Tereshchenko <tereshch@ohsu.edu>
***August 2019
***use STATA 15
***use long data file for time-updated survival analysis


gen trSVGaz = (SVGaz*2)+360
gen trpSVGaz = (pSVGaz*2)+360

sum QRS_Tm 
gen z_QRS_T = (QRS_Tm - r(mean))/r(sd)
sum SVGel
gen z_SVGel = (SVGel - r(mean))/r(sd)
sum SVGmag
gen z_SVGmag = (SVGmag - r(mean))/r(sd)
sum SAI_QRST
gen z_SAI = (SAI_QRST - r(mean))/r(sd)
sum pQRS_Ta
gen z_pQRS_T = (pQRS_Ta - r(mean))/r(sd)
sum pSVGel
gen z_pSVGel = ( pSVGel - r(mean))/r(sd)
sum pSVGmag
gen z_pSVGmag = (pSVGmag - r(mean))/r(sd)
sum trSVGaz
gen z_trSVGaz = (trSVGaz - r(mean))/r(sd)
sum trpSVGaz
gen z_trpSVGaz = (trpSVGaz - r(mean))/r(sd)
sum vrate
gen z_vrate = (vrate - r(mean))/r(sd)
sum qtc
gen z_qtc = (qtc - r(mean))/r(sd)
sum qrsd
gen z_qrsd = (qrsd - r(mean))/r(sd)
sum Cornel
gen z_Cornel = (Cornel - r(mean))/r(sd)



***model 2 with interaction term


stcox c.z_QRS_T##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_pQRS_T##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_pSVGel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_SVGel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_trSVGaz##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_trpSVGaz##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_SVGmag##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_pSVGmag##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_SAI##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_vrate##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_qrsd##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_qtc##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det

stcox c.z_Cornel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr 
estat phtest, det


****stratified Cox model 2 for whites


***model 2


stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_pSVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_SVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_trSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_trpSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_vrate c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_qrsd c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_qtc c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det

stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0
estat phtest, det



****stratified Cox model 2 for blacks


***model 2


stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_pSVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_SVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_trSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_trpSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_vrate c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_qrsd c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_qtc c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det

stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1
estat phtest, det







****competing risk of SCD model 2 time-updated; lcompd==3 is SCD; lcompd==2 is nonSCD
stset time, id(id) failure(lcompd==3) time0(ECGtime) scale(1)

stcrreg  c.z_pQRS_T##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_QRS_T##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_pSVGmag##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_SVGmag##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_pSVGel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_SVGel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_trpSVGaz##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_trSVGaz##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_SAI##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_vrate##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_qtc##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_qrsd##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_Cornel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)



****stratified by race models for SCD

*** for whites

stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_pSVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_SVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_trpSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_trSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_vrate c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_qtc c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_qrsd c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 2)


*** for blacks

stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_pSVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_SVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_trpSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_trSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_vrate c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_qtc c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_qrsd c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 2)





*****competing risk models for non-SCD

stset time, id(id) failure(lcompd==2) time0(ECGtime) scale(1)


stcrreg  c.z_pQRS_T##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_QRS_T##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_pSVGmag##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_SVGmag##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_pSVGel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_SVGel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_trpSVGaz##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_trSVGaz##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_SAI##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_vrate##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_qtc##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_qrsd##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_Cornel##i.black c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)


****stratified by race models for nonSCD

***for whites

stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_pSVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_SVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_trpSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_trSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_vrate c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_qtc c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_qrsd c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==0, compete(lcompd==1 3)

***for blacks

stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_pSVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_SVGel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_trpSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_trSVGaz c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_vrate c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_qtc c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_qrsd c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.htnV1  i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if black==1, compete(lcompd==1 3)





****interaction with both race and HTN

gen raceHTN = 0 if black==0 & htnV1==0
recode raceHTN (.=1) if black==0 & htnV1==1
recode raceHTN (.=2) if black==1 & htnV1==1
recode raceHTN (.=3) if black==1 & htnV1==0
tab raceHTN, mis




stcox c.z_pSVGmag##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_SVGmag##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_pQRS_T##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_QRS_T##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det


stcox c.z_SAI##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_Cornel##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det




*** competing risk of SCD models for both race and hypertension categories
***competing risk of SCD model 2 time-updated; lcompd==3 is SCD; lcompd==2 is nonSCD
stset time, id(id) failure(lcompd==3) time0(ECGtime) scale(1)

stcrreg  c.z_pQRS_T##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_QRS_T##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_pSVGmag##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_SVGmag##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

***competing risk of nonSCD model 2 time-updated; lcompd==3 is SCD; lcompd==2 is nonSCD
stset time, id(id) failure(lcompd==2) time0(ECGtime) scale(1)

stcrreg  c.z_pQRS_T##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_QRS_T##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_pSVGmag##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_SVGmag##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

****interaction by both prevalent CHD and raceHTN
gen raceCHD = 0 if black==0 & chdV1==0
recode raceCHD (.=1) if black==0 & chdV1==1
recode raceCHD (.=2) if black==1 & chdV1==1
recode raceCHD (.=3) if black==1 & chdV1==0

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



stcox c.z_pSVGmag##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_SVGmag##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_pQRS_T##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_QRS_T##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det


stcox c.z_SAI##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det


stcox c.z_Cornel##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det



stcox c.z_pSVGmag##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_SVGmag##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_pQRS_T##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_QRS_T##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_SAI##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det

stcox c.z_Cornel##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr
estat phtest, det


*****stratified analysis by race and HTN

stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0
estat phtest, det

stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1
estat phtest, det

stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2
estat phtest, det

stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3
estat phtest, det


stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0
estat phtest, det

stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1
estat phtest, det

stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2
estat phtest, det

stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3
estat phtest, det


stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0
estat phtest, det

stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1
estat phtest, det

stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2
estat phtest, det

stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3
estat phtest, det


stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3
estat phtest, det


stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3
estat phtest, det

stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3
estat phtest, det



****cox models stratified by race and CHD subgroups
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0
estat phtest, det
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1
estat phtest, det
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==2
estat phtest, det
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3
estat phtest, det


stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0
estat phtest, det
stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1
estat phtest, det
stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1  tdaf tdstr if raceCHD==2
estat phtest, det
stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3
estat phtest, det


stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0
estat phtest, det
stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1
estat phtest, det
stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1  tdaf tdstr if raceCHD==2
estat phtest, det
stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3
estat phtest, det


stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1  tdaf tdstr if raceCHD==2
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3
estat phtest, det


stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1  tdaf tdstr if raceCHD==2
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3
estat phtest, det

stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1  tdaf tdstr if raceCHD==2
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3
estat phtest, det

****stratified SCD risk by race and BMI subgroups

stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0
estat phtest, det
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1
estat phtest, det
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2
estat phtest, det
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3
estat phtest, det
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4
estat phtest, det
stcox c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5
estat phtest, det


stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0
estat phtest, det
stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1
estat phtest, det
stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2
estat phtest, det
stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3
estat phtest, det
stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4
estat phtest, det
stcox c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5
estat phtest, det

stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0
estat phtest, det
stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1
estat phtest, det
stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2
estat phtest, det
stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3
estat phtest, det
stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4
estat phtest, det
stcox c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5
estat phtest, det


stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4
estat phtest, det
stcox c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5
estat phtest, det

stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4
estat phtest, det
stcox c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5
estat phtest, det

stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4
estat phtest, det
stcox c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1 i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5
estat phtest, det




****additional competing risk of SCD

***htn subgroups

stcrreg  c.z_SAI##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_Cornel##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

***CHD subgroups

stcrreg  c.z_pQRS_T##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_QRS_T##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_pSVGmag##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_SVGmag##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_SAI##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_Cornel##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

***BMI subgroups


stcrreg  c.z_pQRS_T##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_QRS_T##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_pSVGmag##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_SVGmag##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_SAI##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)

stcrreg  c.z_Cornel##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 2)


***competing risk of nonSCD model 2 time-updated; lcompd==3 is SCD; lcompd==2 is nonSCD
stset time, id(id) failure(lcompd==2) time0(ECGtime) scale(1)


***htn subgroups

stcrreg  c.z_SAI##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_Cornel##i.raceHTN c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

***CHD subgroups

stcrreg  c.z_pQRS_T##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_QRS_T##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_pSVGmag##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_SVGmag##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_SAI##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_Cornel##i.raceCHD c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicatV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

***BMI subgroups


stcrreg  c.z_pQRS_T##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_QRS_T##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_pSVGmag##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_SVGmag##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_SAI##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

stcrreg  c.z_Cornel##i.raceBMI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr , compete(lcompd==1 3)

*** SCD CHD subgroups stratified 

stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0, compete(lcompd==1 2)
stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1, compete(lcompd==1 2)
stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==2, compete(lcompd==1 2)
stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3, compete(lcompd==1 2)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0, compete(lcompd==1 2)
stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1, compete(lcompd==1 2)
stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdaf tdstr if raceCHD==2, compete(lcompd==1 2)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3, compete(lcompd==1 2)


stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0, compete(lcompd==1 2)
stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf  tdaf tdstr if raceCHD==1, compete(lcompd==1 2)
stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1   tdaf tdstr if raceCHD==2, compete(lcompd==1 2)
stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3, compete(lcompd==1 2)


stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0, compete(lcompd==1 2)
stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf  tdaf tdstr if raceCHD==1, compete(lcompd==1 2)
stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1  tdaf tdstr if raceCHD==2, compete(lcompd==1 2)
stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3, compete(lcompd==1 2)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0, compete(lcompd==1 2)
stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==1, compete(lcompd==1 2)
stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf  tdaf tdstr if raceCHD==2, compete(lcompd==1 2)
stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf  tdaf tdstr if raceCHD==3, compete(lcompd==1 2)


stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==0, compete(lcompd==1 2)
stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf  tdaf tdstr if raceCHD==1, compete(lcompd==1 2)
stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf  tdaf tdstr if raceCHD==2, compete(lcompd==1 2)
stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceCHD==3, compete(lcompd==1 2)

***BMI subgroups stratified SCD outcome


stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0, compete(lcompd==1 2)
stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1, compete(lcompd==1 2)
stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2, compete(lcompd==1 2)
stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3, compete(lcompd==1 2)
stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4, compete(lcompd==1 2)
stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5, compete(lcompd==1 2)


stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0, compete(lcompd==1 2)
stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1, compete(lcompd==1 2)
stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2, compete(lcompd==1 2)
stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3, compete(lcompd==1 2)
stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4, compete(lcompd==1 2)
stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5, compete(lcompd==1 2)


stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0, compete(lcompd==1 2)
stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1, compete(lcompd==1 2)
stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2, compete(lcompd==1 2)
stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3, compete(lcompd==1 2)
stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4, compete(lcompd==1 2)
stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5, compete(lcompd==1 2)

stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0, compete(lcompd==1 2)
stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1, compete(lcompd==1 2)
stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2, compete(lcompd==1 2)
stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3, compete(lcompd==1 2)
stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4, compete(lcompd==1 2)
stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5, compete(lcompd==1 2)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0, compete(lcompd==1 2)
stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1, compete(lcompd==1 2)
stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2, compete(lcompd==1 2)
stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3, compete(lcompd==1 2)
stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4, compete(lcompd==1 2)
stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5, compete(lcompd==1 2)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==0, compete(lcompd==1 2)
stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==1, compete(lcompd==1 2)
stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==2, compete(lcompd==1 2)
stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==3, compete(lcompd==1 2)
stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==4, compete(lcompd==1 2)
stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.htnV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.chdV1 c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceBMI==5, compete(lcompd==1 2)

***race and HTN subgroups stratified analyses - competing SCD risk

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0, compete(lcompd==1 2)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1, compete(lcompd==1 2)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2, compete(lcompd==1 2)

stcrreg  c.z_SAI c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3, compete(lcompd==1 2)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0, compete(lcompd==1 2)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1, compete(lcompd==1 2)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2, compete(lcompd==1 2)

stcrreg  c.z_Cornel c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3, compete(lcompd==1 2)


stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0, compete(lcompd==1 2)

stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1, compete(lcompd==1 2)

stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2, compete(lcompd==1 2)

stcrreg  c.z_pQRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3, compete(lcompd==1 2)



stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0, compete(lcompd==1 2)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1, compete(lcompd==1 2)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2, compete(lcompd==1 2)

stcrreg  c.z_QRS_T c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3, compete(lcompd==1 2)



stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0, compete(lcompd==1 2)

stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1, compete(lcompd==1 2)

stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2, compete(lcompd==1 2)

stcrreg  c.z_pSVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3, compete(lcompd==1 2)


stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==0, compete(lcompd==1 2)

stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==1, compete(lcompd==1 2)

stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==2, compete(lcompd==1 2)

stcrreg  c.z_SVGmag c.ageV1 i.female i.placecat  i.hfV1 i.strokeV1 i.chdV1 i.dmV1 i.curdrkV1 i.cursmkV1 c.leisureV1 c.workV1 c.sportV1  i.bmicat c.tchV1 c.trigV1  c.hdlV1 i.htnmedV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.calciumV1 c.magV1 c.phosphV1  c.albV1 c.totprotV1 c.uricaV1 c.bunV1 i.ckdV1  i.lessHS i.occupV1 i.income_cat i.insurV1 tdhf tdchd tdaf tdstr if raceHTN==3, compete(lcompd==1 2)


