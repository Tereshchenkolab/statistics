***Analysis of the data for MESA MS #AM084
***by Larisa Tereshchenko <tereshch@ohsu.edu>
***April-May 2021
***use STATA 16.1

help concord

***calculate heart rate
gen HR1 = 60000/ RRinterval_ms1
gen HR2 = 60000/ RRinterval_ms2
gen HR3 = 60000/ RRinterval_ms3
label variable HR1 "heart rate ECG1, bpm"
label variable HR2 "heart rate ECG2, bpm"
label variable HR3 "heart rate ECG3, bpm"

***Bland-Altman analysis
concord peakQRSTAngle_deg1 peakQRSTAngle_deg2, sum
concord peakQRSTAngle_deg1 peakQRSTAngle_deg2, loa

***calculate relative bias
egen pQRSTa12 = rowmean ( peakQRSTAngle_deg1 peakQRSTAngle_deg2)
di   (-0.047/ pQRSTa12)*100

concord HR1 HR2, sum
egen HR12 = rowmean ( HR1 HR2)
di    (-0.236/ HR12)*100

concord areaQRSTAngle_deg1 areaQRSTAngle_deg2 , sum
concord areaQRSTAngle_deg1 areaQRSTAngle_deg2 , loa

egen aQRSTa12 = rowmean ( areaQRSTAngle_deg1 areaQRSTAngle_deg2 )
di  (-0.124/ aQRSTa12)*100

***transform units of measurements
replace AUCofQTVectorMagnitude_uVms1 = AUCofQTVectorMagnitude_uVms1/1000
replace AUCofQTVectorMagnitude_uVms2 = AUCofQTVectorMagnitude_uVms2/1000
replace AUCofQTVectorMagnitude_uVms3 = AUCofQTVectorMagnitude_uVms3/1000
rename AUCofQTVectorMagnitude_uVms1 VMQTi1
rename AUCofQTVectorMagnitude_uVms2 VMQTi2
rename AUCofQTVectorMagnitude_uVms3 VMQTi3
label variable VMQTi1 "AUCofQTVectorMagnitude_mVms"
label variable VMQTi2 "AUCofQTVectorMagnitude_mVms"
label variable VMQTi3 "AUCofQTVectorMagnitude_mVms"

egen VMQTi12 = rowmean ( VMQTi1 VMQTi2 )
concord VMQTi1 VMQTi2 , sum
di  (0.097/ VMQTi12)*100

replace SAIQRST1 = SAIQRST1 /1000
replace SAIQRST2 = SAIQRST2 /1000
replace SAIQRST3 = SAIQRST3 /1000
label variable SAIQRST1 "SAIQRST mVms"
label variable SAIQRST2 "SAIQRST mVms"
label variable SAIQRST3 "SAIQRST mVms"

egen SAIQRST12 = rowmean (SAIQRST1 SAIQRST2 )
concord SAIQRST1 SAIQRST2, sum
di   (0.229/ SAIQRST12)*100

replace WilsonSVG_uVms1 = WilsonSVG_uVms1/1000
replace WilsonSVG_uVms2 = WilsonSVG_uVms2/1000
replace WilsonSVG_uVms3 = WilsonSVG_uVms3/1000
label variable WilsonSVG_uVms1 "WilsonSVG_mVms"
label variable WilsonSVG_uVms2 "WilsonSVG_mVms"
label variable WilsonSVG_uVms3 "WilsonSVG_mVms"
rename WilsonSVG_uVms1 WilsonSVG_mVms1
rename WilsonSVG_uVms2 WilsonSVG_mVms2
rename WilsonSVG_uVms3 WilsonSVG_mVms3

egen WilsonSVG12 = rowmean ( WilsonSVG_mVms1 WilsonSVG_mVms2 )
concord WilsonSVG_mVms1 WilsonSVG_mVms2, sum
di  (0.138 / WilsonSVG12)*100

replace peakSVGMagnitude_uV1 = peakSVGMagnitude_uV1/1000
replace peakSVGMagnitude_uV2 = peakSVGMagnitude_uV2/1000
replace peakSVGMagnitude_uV3 = peakSVGMagnitude_uV3/1000
rename peakSVGMagnitude_uV1 peakSVGMagnitude_mV1
rename peakSVGMagnitude_uV2 peakSVGMagnitude_mV2
rename peakSVGMagnitude_uV3 peakSVGMagnitude_mV3
label variable peakSVGMagnitude_mV1 peakSVGMagnitude_mV
label variable peakSVGMagnitude_mV2 peakSVGMagnitude_mV
label variable peakSVGMagnitude_mV3 peakSVGMagnitude_mV

egen pSVGmag12 = rowmean ( peakSVGMagnitude_mV1 peakSVGMagnitude_mV2 )
concord peakSVGMagnitude_mV1 peakSVGMagnitude_mV2 , sum
di (0.001/ pSVGmag12)*100

concord peakSVGElevation_deg1 peakSVGElevation_deg2 , sum
egen pSVGel12 = rowmean ( peakSVGElevation_deg1 peakSVGElevation_deg2 )
di ( -0.036 / pSVGel12)*100
concord areaSVGElevation_deg1 areaSVGElevation_deg2 , sum
egen aSVGel12 = rowmean ( areaSVGElevation_deg1 areaSVGElevation_deg2 )
di ( -0.060 / aSVGel12)*100

concord peakSVGAzimuth_deg1 peakSVGAzimuth_deg2 , sum
egen pSVGaz12 = rowmean ( peakSVGAzimuth_deg1 peakSVGAzimuth_deg2 )

***to calculate relative bias, azimuth must be transformed (*2+360)
gen trpSVGaz1 = (peakSVGAzimuth_deg1*2)+360
gen trpSVGaz2 = (peakSVGAzimuth_deg2*2)+360
gen trpSVGaz3 = (peakSVGAzimuth_deg3*2)+360
concord trpSVGaz1 trpSVGaz2 , sum
egen trpSVGaz12 = rowmean ( trpSVGaz1 trpSVGaz2 )
di ( -0.223 / trpSVGaz12 )*100

concord areaSVGAzimuth_deg1 areaSVGAzimuth_deg2 , sum
gen traSVGaz1 = (areaSVGAzimuth_deg1*2)+360
gen traSVGaz2 = (areaSVGAzimuth_deg2*2)+360
gen traSVGaz3 = (areaSVGAzimuth_deg3*2)+360
concord traSVGaz1 traSVGaz2 , sum
egen traSVGaz12 = rowmean ( traSVGaz1 traSVGaz2 )
di ( -0.957/ traSVGaz12 )*100

***conditions for subgroup analysis 
***(by the number of beats included in the median beat template)
drop if NoofBeatsinMedian1 <=6 | NoofBeatsinMedian1 >=10
drop if NoofBeatsinMedian2 <=6 | NoofBeatsinMedian2 >=10

keep if NoofBeatsinMedian1 <=6
keep if NoofBeatsinMedian2 <=6

keep if NoofBeatsinMedian1 >=10
keep if NoofBeatsinMedian2 >=10

*** log-transformed mean-centered values of SAI and VMQTi
summarize var, meanonly
gen centered_var = var - r(mean)


gen logSAI1 = log( SAIQRST1)
gen logSAI2 = log( SAIQRST2)
gen logSAI3 = log( SAIQRST3)
sum logSAI1
gen logSAImean1 = logSAI1 -  4.943652
sum logSAI2
gen logSAImean2 = logSAI2 - 4.940598
gen logVMQTi1 = log( VMQTi1)
gen logVMQTi2 = log( VMQTi2)
gen logVMQTi3 = log( VMQTi3)
sum logVMQTi1
gen logQTVMimean1 = logVMQTi1 -  4.529156
sum logVMQTi2
gen logQTVMimean2 = logVMQTi2 -   4.526773


***coefficient of variation
help cv
reg HR1 HR2
cv
reg peakQRSTAngle_deg1 peakQRSTAngle_deg2
cv
reg areaQRSTAngle_deg1 areaQRSTAngle_deg2
cv
reg peakSVGElevation_deg1 peakSVGElevation_deg2
cv
reg areaSVGElevation_deg1 areaSVGElevation_deg2
cv
reg peakSVGMagnitude_mV1 peakSVGMagnitude_mV2
cv
reg VMQTi1 VMQTi2
cv
reg WilsonSVG_mVms1 WilsonSVG_mVms2
cv
reg SAIQRST1 SAIQRST2
cv
reg trpSVGaz1 trpSVGaz2
cv
reg traSVGaz1 traSVGaz2
cv

*** intercalss correlation coefficient or Cronbach's alpha
alpha HR1 HR2, std item detail
alpha HR1 HR2, std
alpha peakQRSTAngle_deg1 peakQRSTAngle_deg2, std
alpha areaQRSTAngle_deg1 areaQRSTAngle_deg2, std
alpha peakSVGElevation_deg1 peakSVGElevation_deg2, std
alpha areaSVGElevation_deg1 areaSVGElevation_deg2, std
alpha peakSVGMagnitude_mV1 peakSVGMagnitude_mV2, std
alpha VMQTi1 VMQTi2, std
alpha WilsonSVG_mVms1 WilsonSVG_mVms2, std
alpha SAIQRST1 SAIQRST2, std
alpha trpSVGaz1 trpSVGaz2, std
alpha traSVGaz1 traSVGaz2, std


***prepare graphs
graph combine aQRST_N.gph aQRST_S.gph  aQRST_VP.gph ,  imargin(1 1 1 1) xcom ycom rows(1) cols(3)  iscale(*.8)
graph combine aQRST_Nless6.gph  aQRST_N7_9.gph  aQRST_Nabove10.gph ,  imargin(1 1 1 1) xcom ycom rows(1) cols(3)  iscale(*.8)
graph combine aQRSTall3.gph  aQRST_beats3.gph,  imargin(1 1 1 1) xcom ycom rows(2) cols(1)  iscale(*.8)
