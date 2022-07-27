****CaVaR-Co19 study data analysis
***STATA 17
***July 2022
***by Larisa Tereshchenko <TERESHL@ccf.org>

***imputed each ECG variable one-by-one
mi set mlong
mi xtset, clear
mi stset, clear
mi reshape wide WilsonSVG_uVms RR_interval_ms m3beat ECGdate , i( study_id) j( timecat)
mi register imputed ECGdate1- m3beat3
mi impute chained (pmm, knn(20)) ECGdate1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , dryrun
mi impute chained (pmm, knn(20)) ECGdate1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment chainonly noisily burnin(20) savetrace(impstats, replace) rseed(9999999)
mi impute chained (pmm, knn(20)) ECGdate1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment burnin(20) add(100) rseed(9999999)

mi reshape long ECGdate WilsonSVG_uVms RR_interval_ms m3beat , i( study_id ) j(timecat)
mi xtset study_id timecat
how_many_imputations

mi estimate: xtreg WilsonSVG_uVms i.covid RR_interval_ms m3beat agey sex whiteNH cvdHx nomeds_bCovid1 respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance, re

program emargins, eclass properties(mi)
 version 17
 args outcome
 xtreg WilsonSVG_uVms i.covid RR_interval_ms m3beat agey sex whiteNH cvdHx nomeds_bCovid1 respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance , re
margins, at(covid=(0 1))
post predict(outcome(`outcome'))
end

mi estimate, cmdok: emargins 1

clear

***Repeat the same as above procedure for another ECG variable 
mi xtset, clear
mi stset, clear
mi set mlong
mi reshape wide areaQRSTAngle_deg RR_interval_ms m3beat ECGdate , i( study_id) j( timecat)
mi register imputed ECGdate1- m3beat3
mi impute chained (pmm, knn(20)) ECGdate1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , dryrun
mi impute chained (pmm, knn(20)) ECGdate1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment burnin(20) add(100) rseed(9999999)
mi reshape long ECGdate areaQRSTAngle_deg RR_interval_ms m3beat , i( study_id ) j(timecat)
mi xtset study_id timecat


***repeat for another ECG variable
u
mi xtset, clear
mi stset, clear
mi set mlong
mi reshape wide areaSVGAzimuth_deg RR_interval_ms m3beat ECGdate , i( study_id) j( timecat)
mi register imputed ECGdate1- m3beat3
mi impute chained (pmm, knn(20)) ECGdate1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , dryrun
drop ECGdate*
mi impute chained (pmm, knn(20)) areaSVGAzimuth_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , dryrun
mi impute chained (pmm, knn(20)) areaSVGAzimuth_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y ,augment chainonly noisily burnin(20) savetrace(impstats, replace) rseed(9999999)
mi impute chained (pmm, knn(20)) areaSVGAzimuth_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y ,augment burnin(20) add(100) rseed(9999999)
mi reshape long areaSVGAzimuth_deg RR_interval_ms m3beat , i( study_id ) j(timecat)
mi xtset study_id timecat

mi estimate: xtreg areaSVGAzimuth_deg i.covid RR_interval_ms m3beat agey sex whiteNH cvdHx nomeds_bCovid1 respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance , re
mi passive: gen traSVGaz = (areaSVGAzimuth_deg*2)+360

mi estimate: xtreg traSVGaz i.covid RR_interval_ms m3beat agey sex whiteNH cvdHx nomeds_bCovid1 respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance , re

***repeat for another ECG variable
mi xtset, clear
mi stset, clear
mi set mlong
mi reshape wide areaSVGElevation_deg RR_interval_ms m3beat , i( study_id) j( timecat)
mi register imputed areaSVGElevation_deg1 - m3beat3
mi impute chained (pmm, knn(20)) areaSVGElevation_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , dryrun
mi impute chained (pmm, knn(20)) areaSVGElevation_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment chainonly noisily burnin(20) savetrace(impstats, replace) rseed(9999999)
mi impute chained (pmm, knn(20)) areaSVGElevation_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment burnin(20) add(100) rseed(9999999)
mi reshape long areaSVGElevation_deg RR_interval_ms m3beat , i( study_id ) j(timecat)
mi xtset study_id timecat

mi estimate: xtreg areaSVGElevation_deg i.covid RR_interval_ms m3beat agey sex whiteNH cvdHx nomeds_bCovid1 respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance , re


***repeat for another ECG variable
mi xtset, clear
mi stset, clear
mi set mlong
mi reshape wide SAIQRST RR_interval_ms m3beat , i( study_id) j( timecat)
mi register imputed RR_interval_ms1 - m3beat3
mi impute chained (pmm, knn(20)) RR_interval_ms1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , dryrun
mi impute chained (pmm, knn(20)) RR_interval_ms1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y ,augment chainonly noisily burnin(20) savetrace(impstats, replace) rseed(9999999)
mi impute chained (pmm, knn(20)) RR_interval_ms1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y ,augment burnin(20) add(100) rseed(9999999)
mi reshape long SAIQRST RR_interval_ms m3beat , i( study_id ) j(timecat)
mi xtset study_id timecat

mi estimate: xtreg SAIQRST i.covid RR_interval_ms m3beat agey sex whiteNH cvdHx nomeds_bCovid1 respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance , re


**repeat for another ECH variable
mi xtset, clear
mi stset, clear
mi set mlong
mi reshape wide QTInterval_ms QRSduration_ms RR_interval_ms m3beat , i( study_id) j( timecat)
mi register imputed QTInterval_ms1 - m3beat3
mi impute chained (pmm, knn(20)) QTInterval_ms1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , dryrun
mi impute chained (pmm, knn(20)) QTInterval_ms1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment chainonly noisily burnin(20) savetrace(impstats, replace) rseed(9999999)
mi impute chained (pmm, knn(20)) QTInterval_ms1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment burnin(20) add(100) rseed(9999999)
mi reshape long QTInterval_ms QRSduration_ms RR_interval_ms m3beat , i( study_id ) j(timecat)
mi xtset study_id timecat

mi estimate: xtreg QTInterval_ms i.covid RR_interval_ms m3beat agey sex whiteNH cvdHx nomeds_bCovid1 respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance , re
mi estimate: xtreg QRSduration_ms i.covid RR_interval_ms m3beat agey sex whiteNH cvdHx nomeds_bCovid1 respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance , re


***Repeat for another ECG variable

mi xtset, clear
mi stset, clear
mi set mlong
mi reshape wide peakSVGElevation_deg RR_interval_ms m3beat , i( study_id) j( timecat)
mi register imputed peakSVGElevation_deg1 - m3beat3
mi impute chained (pmm, knn(20)) peakSVGElevation_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , dryrun
mi impute chained (pmm, knn(20)) peakSVGElevation_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment chainonly noisily burnin(20) savetrace(impstats, replace) rseed(9999999)
mi impute chained (pmm, knn(20)) peakSVGElevation_deg1 - m3beat3 = i.covid sex nomeds_bCovid1 agey cvdHx respHx liverHx cerebrovascHx kidneyHx thrombHx diabetesHx immunHx addict endocrHx bloodHx sysdisHx whiteNH raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covidwhy insurance dead ttoutcome1 ttdeath ttoutcome1y , augment burnin(20) add(100) rseed(9999999)
mi reshape long peakSVGElevation_deg RR_interval_ms m3beat , i( study_id ) j(timecat)
mi xtset study_id timecat

mi passive: gen QTc =  QTInterval_ms/sqrt( RR_interval_ms/1000)
mi passive: gen time1 =  ECGdate2- ECGdate1
mi passive: gen time2 =  ECGdate3- ECGdate2




