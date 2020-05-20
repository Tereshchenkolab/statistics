*****analysis of ARIC approved manuscript #3293
***by Larisa Tereshchenko <tereshch@ohsu.edu>
***February 2019
***use STATA 15 or later
***Time-updated Cox and competing risk models using long data file

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



***model 2
***note: PH assumption for peak QRS-T angle not met
stcox c.z_pQRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
*** note: PH for area QRS-T angle not met
stcox c.z_QRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det

stcox c.z_pSVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_SVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
****note: PH for peak SVG azimuth is not met
stcox c.z_trpSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
***note: PH for area SVG az not met
stcox c.z_trSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
***note: PH for SAI is not met
stcox c.z_SAI##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_pSVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1    tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_SVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1    tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
***traditional ECG
stcox c.z_vrate##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1    tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_qtc##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_qrsd##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1    tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_Cornel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1   tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
***note PH for males peak QRS-T angle not met
***stratified by sex
stcox c.z_pQRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_pQRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det
***note PH for males area QRS-T angle not met
stcox c.z_QRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_QRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_pSVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_pSVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_SVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_SVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_trpSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_trpSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_trSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_trSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_SAI##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_SAI##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_pSVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_pSVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_SVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_SVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

****by sex stratified traditional ECG
stcox c.z_vrate i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_vrate i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det
stcox c.z_qrsd i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_qrsd i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det
stcox c.z_qtc i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_qtc i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det
stcox c.z_Cornel i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_Cornel i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

***model 3 adjusted for traditional ECG metrics 


stcox c.z_pQRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_QRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_pSVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_SVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_trpSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_trSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_SAI##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_pSVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_SVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det


stcox c.z_pQRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_pQRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_QRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_QRS_T##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_pSVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_pSVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_SVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_SVGel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_trpSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_trpSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_trSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_trSVGaz##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_SAI##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_SAI##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_pSVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_pSVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

stcox c.z_SVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_SVGmag##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

***all with interaction term traditional ECG
stcox c.z_vrate##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_qtc##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_qrsd##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
stcox c.z_Cornel##i.female i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf
estat phtest, det
****by sex stratified traditional ECG
stcox c.z_vrate i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_vrate i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det
stcox c.z_qrsd i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_qrsd i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det
stcox c.z_qtc i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_qtc i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det
stcox c.z_Cornel i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==0
estat phtest, det
stcox c.z_Cornel i.bmicatV1 c.ageV1 i.race_place  tdhf i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1 c.vrate c.qrsd c.qtc i.ecgLVH c.Cornellvol tdstr tdchd i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf if female==1
estat phtest, det

****competing risk of SCD model 2 time-updated; lcompd==3 is SCD; lcompd==2 is nonSCD
stset time, id(id) failure(lcompd==3) time0(ECGtime) scale(1)

stcrreg c.z_pQRS_T##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_QRS_T##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_pSVGel##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_SVGel##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_trpSVGaz##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_trSVGaz##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_pSVGmag##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_SVGmag##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_SAI##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_vrate##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_qtc##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_qrsd##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)
stcrreg c.z_Cornel##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 2)

****stratified by sex models for SCD

stcrreg c.z_pQRS_T c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_pQRS_T c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_QRS_T c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_QRS_T c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_pSVGel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_pSVGel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_SVGel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_SVGel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_trpSVGaz c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_trpSVGaz c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_trSVGaz c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_trSVGaz c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_pSVGmag c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_pSVGmag c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_SVGmag c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_SVGmag c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_SAI c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_SAI c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_vrate c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_vrate c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_qtc c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_qtc c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_qrsd c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_qrsd c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)

stcrreg c.z_Cornel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 2)
stcrreg c.z_Cornel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 2)


*****competing risk models for non-SCD

stset time, id(id) failure(lcompd==2) time0(ECGtime) scale(1)

stcrreg c.z_pQRS_T##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_QRS_T##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_pSVGel##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_SVGel##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_trpSVGaz##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_trSVGaz##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_pSVGmag##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_SVGmag##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_SAI##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_vrate##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_qtc##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_qrsd##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)
stcrreg c.z_Cornel##i.female c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf, compete(compdeath==1 3)

****stratified by sex models for nonSCD

stcrreg c.z_pQRS_T c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_pQRS_T c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_QRS_T c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_QRS_T c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_pSVGel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_pSVGel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_SVGel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_SVGel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_trpSVGaz c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_trpSVGaz c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_trSVGaz c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_trSVGaz c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_pSVGmag c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_pSVGmag c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_SVGmag c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_SVGmag c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_SAI c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_SAI c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_vrate c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_vrate c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_qtc c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_qtc c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_qrsd c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_qrsd c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)

stcrreg c.z_Cornel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==0, compete(compdeath==1 3)
stcrreg c.z_Cornel c.ageV1 i.race_place i.bmicatV1 i.hfV1 i.curdrkV1  i.htnV1 c.tchV1 c.trigV1 c.leisureV1 i.dmV1 i.cursmkV1 c.hdlV1 i.htnmedV1  i.strokeV1 i.chdV1 i.AVNmedV1 c.sodiumV1 c.potasV1 c.bunV1 c.calciumV1 c.magV1 c.phosphV1 c.albV1 c.totprotV1 c.uricaV1 i.educHS i.b1.postmenop i.ckdstage2 tdaf tdstr tdchd tdhf if female==1, compete(compdeath==1 3)





