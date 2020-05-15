use "D:\Lora_new\my papers\2020\2020 John GEH stroke\stata data\GEH stroke wide nomiss 2_27_20.dta"
***Table 1 
tabulate female score, chi2 column
tabulate cvdV1 score, chi2 column
tabulate white score, chi2 column
oneway bmiV1 score, tabulate
oneway whrV1 score, tabulate
tabulate htnV1 score, chi2 column
tabulate htnmedV1 score, chi2 column
oneway sbpV1 score, tabulate
oneway dbpV1 score, tabulate
tabulate dmV1 score, chi2 column
oneway eGFRckdepiV1 score, tabulate
tabulate cursmkV1 score, chi2 column
tabulate curdrkV1 score, chi2 column
tabulate leisureV1 score, chi2 column
oneway leisureV1 score, tabulate
oneway tchV1 score, tabulate
oneway hdlV1 score, tabulate
oneway trigV1 score, tabulate
tabulate cholmedV1 score, chi2 column
tabulate plaqueV1 score, chi2 column
tabulate ASA_V1 score, chi2 column
tabulate anticoag_V1 score, chi2 column
tabulate AVNmedV1 score, chi2 column
oneway vrateV1 score, tabulate
oneway qrsdV1 score, tabulate
oneway qtcV1 score, tabulate
tabulate BBBIVCDV1 score, chi2 column
tabulate ecgLVHV1 score, chi2 column
tabulate PVCany score, chi2 column
tabulate PVCV1 score, chi2 column
tabulate mbeatSVany score, chi2 column
tabulate PACany score, chi2 column
tabulate aPTVv1_V1 score, chi2 column
tabulate aPRV1 score, chi2 column
tabulate abnPaxV1 score, chi2 column
tabulate IBBBany score, chi2 column

***Table 2
tabulate IBBBany typeStroke, chi2 column
tabulate ecgLVHV1 typeStroke , chi2 column
tabulate abnPaxV1 typeStroke , chi2 column
tabulate aPRV1 typeStroke , chi2 column
tabulate aPTVv1_V1 typeStroke , chi2 column
circwwm QRS_TmV1 , by( typeStroke )
circcomp QRS_TmV1 , by(typeStroke) detail
circwwm QRS_TmV1 , by( typeStroke )
circcomp QRS_TmV1 , by(typeStroke) detail
oneway SAI_QRSTV1 typeStroke , tabulate
oneway SVGmagV1 typeStroke , tabulate
oneway pSVGmagV1 typeStroke , tabulate
circwwm pQRS_TaV1 , by( typeStroke )
circcomp pQRS_TaV1 , by(typeStroke) detail
circwwm pSVGelV1 , by( typeStroke )
circcomp pSVGelV1 , by(typeStroke) detail
circwwm SVGazV1 , by( typeStroke )
circcomp SVGazV1 , by(typeStroke) detail
circwwm pSVGazV1 , by( typeStroke )
circcomp pSVGazV1 , by(typeStroke) detail

***Table 3 Cox regression
stset ttdpEIByrs, id(id_n) failure(dpEIB==1) scale(1)
stset ttdpICHyrs, id(id_n) failure(dpICH==1) scale(1)
stset ttdpTIByrs, id(id_n) failure(dpTIB==1) scale(1)

***model 1

stcox i.IBBBany i.place_race  c.ageV1 i.female
estat phtest, det

stcox i.BBBIVCDV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox i.PVCV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox i.ecgLVHV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_qrsdV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_qtcV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox i.score45 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_SAIV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_pSVGmagV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_SVGmagV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_trpSVGazV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_traSVGazV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_pSVGelV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_SVGelV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_pQRS_TV1 i.place_race  c.ageV1 i.female
estat phtest, det

stcox c.z_QRS_TV1 i.place_race  c.ageV1 i.female
estat phtest, det


***model 2 add prevalent CVD and cardiovascular risk factors, including carotid artery plaque
stcox i.IBBBany i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox i.BBBIVCDV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det


stcox i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox i.ecgLVHV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_qrsdV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_qtcV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox i.score45 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_SAIV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_pSVGmagV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_SVGmagV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_trpSVGazV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_traSVGazV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_pSVGelV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_SVGelV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_pQRS_TV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det

stcox c.z_QRS_TV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1
estat phtest, det




***Model 3 add atrial substrate characteristics
stcox i.IBBBany i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox i.BBBIVCDV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox i.ecgLVHV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_qrsdV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_qtcV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox i.score45 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_SAIV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_pSVGmagV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_SVGmagV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_trpSVGazV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_traSVGazV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_pSVGelV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_SVGelV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_pQRS_TV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_QRS_TV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det



***Model 4 add other characteristics of ventricular substrate 
stcox i.IBBBany i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany i.score c.qrsdV1 c.qtcV1 i.BBBIVCDV1 i.ecgLVHV1
estat phtest, det


stcox i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany i.score c.qrsdV1 c.qtcV1 i.BBBIVCDV1 i.ecgLVHV1
estat phtest, det

stcox i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany i.score c.qrsdV1 c.qtcV1 i.BBBIVCDV1 
estat phtest, det

stcox c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany i.score c.qtcV1 i.BBBIVCDV1 
estat phtest, det

stcox c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany i.score i.BBBIVCDV1 
estat phtest, det

stcox i.score45 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_SAIV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_pSVGmagV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_SVGmagV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_trpSVGazV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_traSVGazV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_pSVGelV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_SVGelV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_pQRS_TV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

stcox c.z_QRS_TV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany  i.BBBIVCDV1 
estat phtest, det

****time-updated model 5

stcox i.IBBB i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45 c.qrsd c.qtc i.BBBIVCD i.ecgLVH
estat phtest, det


stcox i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45 c.qrsd c.qtc i.BBBIVCD i.ecgLVH
estat phtest, det

stcox i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45 c.qrsd c.qtc i.BBBIVCD
estat phtest, det

stcox c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45  c.qtc i.BBBIVCD
estat phtest, det

stcox c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45 i.BBBIVCD
estat phtest, det

stcox c.z_QRS_T c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_pQRS_T c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_pSVGel c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_SVGel c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_trpSVGaz c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_traSVGaz c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_pSVGmag c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_SVGmag c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_SAI c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.bmiV1 c.whrV1 c.tchV1 c.hdlV1 c.trigV1 i.cholmedV1 c.leisureV1 i.cursmkV1 i.curdrkV1 i.dmV1 i.plaqueV1 i.htnV1 i.htnmedV1 c.sbpV1 c.dbpV1 c.eGFRckdepiV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

**** sensitivity analysis. models with sequential adjustment 



***Model 3 with atrial substrate characteristics (sensitivity analysis)
stcox i.IBBBany i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox i.BBBIVCDV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox i.ecgLVHV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_qrsdV1 i.place_race c.ageV1 i.female i.cvdV1   c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_qtcV1 i.place_race c.ageV1 i.female i.cvdV1   c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox i.score45 i.place_race c.ageV1 i.female i.cvdV1   c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_SAIV1 i.place_race c.ageV1 i.female i.cvdV1   c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_pSVGmagV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_SVGmagV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_trpSVGazV1 i.place_race c.ageV1 i.female i.cvdV1   c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_traSVGazV1 i.place_race c.ageV1 i.female i.cvdV1   c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_pSVGelV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_SVGelV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_pQRS_TV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det

stcox c.z_QRS_TV1 i.place_race c.ageV1 i.female i.cvdV1  c.vrateV1 i.mbeatSVany i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPaxV1 i.aPTFv1_V1 i.aPRV1 i.AFany i.PACany
estat phtest, det



***Model 4 with other characteristics of ventricular substrate (sensitivity analysis)

stcox i.IBBBany i.place_race c.ageV1 i.female i.cvdV1  i.score c.qrsdV1 c.qtcV1 i.BBBIVCDV1 i.ecgLVHV1
estat phtest, det


stcox i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1  i.score c.qrsdV1 c.qtcV1 i.BBBIVCDV1 i.ecgLVHV1
estat phtest, det

stcox i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1  i.score c.qrsdV1 c.qtcV1 i.BBBIVCDV1 
estat phtest, det

stcox c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1  i.score c.qtcV1 i.BBBIVCDV1 
estat phtest, det

stcox c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1  i.score i.BBBIVCDV1 
estat phtest, det

stcox c.z_SAIV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

stcox c.z_pSVGmagV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

stcox c.z_SVGmagV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

stcox c.z_trpSVGazV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

stcox c.z_traSVGazV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

stcox c.z_pSVGelV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

stcox c.z_SVGelV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

stcox c.z_pQRS_TV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

stcox c.z_QRS_TV1 c.z_qtcV1 c.z_qrsdV1 i.ecgLVHV1 i.PVCV1 i.place_race c.ageV1 i.female i.cvdV1   i.BBBIVCDV1 
estat phtest, det

****time-updated model 5 sensitivity analysis
stcox i.IBBB i.PVC i.place_race c.ageV1 i.female i.cvdV1   c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45 c.qrsd c.qtc i.BBBIVCD i.ecgLVH
estat phtest, det


stcox i.PVC i.place_race c.ageV1 i.female i.cvdV1   c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45 c.qrsd c.qtc i.BBBIVCD i.ecgLVH
estat phtest, det

stcox i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1   c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45 c.qrsd c.qtc i.BBBIVCD
estat phtest, det

stcox c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1   c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45  c.qtc i.BBBIVCD
estat phtest, det

stcox c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1   c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.score45 i.BBBIVCD
estat phtest, det

stcox c.z_QRS_T c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_pQRS_T c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_pSVGel c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_SVGel c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1   c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_trpSVGaz c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_traSVGaz c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_pSVGmag c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1 c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_SVGmag c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1   c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det

stcox c.z_SAI c.z_qtc c.z_qrsd i.ecgLVH i.PVC i.place_race c.ageV1 i.female i.cvdV1  c.vrate i.mbeat3_ i.ASA_V1 i.anticoag_V1 i.AVNmedV1 i.abnPax i.aPTFv1_ i.aPR i.AFany i.PAC_ i.BBBIVCD
estat phtest, det
