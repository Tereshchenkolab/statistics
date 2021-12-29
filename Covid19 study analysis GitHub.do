*** Covd19 study data analysis
*** Stata17
***October 2021
***by Larisa Tereshchenko

use"...OCTRI dataset.dta", replace
sort MRN_CD
sum MRN_CD
quietly by MRN_CD :  gen dup = cond(_N==1,0,_n)
drop if dup>1
sum MRN_CD
clear

***November 19 2021
use "...RedCapExport_10_24_21.dta"
gen covid_positive = 1 if covid1==1 | covid2==1
recode covid_positive (.=0)

***Table 1
ttest agey, by(covid_positive) unequal
tabulate sex covid_positive, chi2 column

gen whiteNH = 1 if black==0 & native==0 & asian==0 & pacific==0 & ethnicity!=1
recode whiteNH (.=0)
tabulate whiteNH covid_positive, chi2 column

tabulate healthy covid_positive, chi2 column
tabulate cvdHx covid_positive, chi2 column
tabulate respHx covid_positive, chi2 column
tabulate liverHx covid_positive, chi2 column
tabulate cerebrovascHx covid_positive, chi2 column
tabulate kidneyHx covid_positive, chi2 column
tabulate thrombHx covid_positive, chi2 column
tabulate diabetesHx covid_positive, chi2 column
tabulate immunHx covid_positive, chi2 column
tabulate addict covid_positive, chi2 column
tabulate endocrHx covid_positive, chi2 column
tabulate bloodHx covid_positive, chi2 column
tabulate sysdisHx covid_positive, chi2 column

gen insured=1 if insured_yes_no==1
recode insured (.=0)
tabulate insured covid_positive, chi2 column

tabulate scaHx covid_positive, chi2 column
tabulate hfHx covid_positive, chi2 column

gen anychdHx=1 if pciHx==1| cabgHx==1| miHx==1| chdHx==1
recode anychdHx(.=0)
tabulate anychdHx covid_positive, chi2 column

tabulate lipidHx covid_positive, chi2 column
tabulate padHx covid_positive, chi2 column
tabulate carotidHx covid_positive, chi2 column

gen noncorHx=1 if carotidHx==1 | padHx==1
recode noncorHx(.=0)
tabulate noncorHx covid_positive, chi2 column

gen nonchdHx=1 if vhdHx==1 | achdHx==1| myocarditisHx==1| channelHx==1 | cmHx==1| peHx==1
recode  nonchdHx (.=0)
tabulate nonchdHx covid_positive, chi2 column

gen raasmed_bCovid1 = 1 if acei_bCovid1==1 | arb_bCovid1==1| arni_bCovid1==1
recode raasmed_bCovid1(.=0)
tabulate raasmed_bCovid1 covid_positive, chi2 column

gen avnodemed_bCovid1 = 1 if ccb_bCovid1==1| bb_bCovid1==1| aad_bCovid1==1
recode avnodemed_bCovid1(.=0)
tabulate avnodemed_bCovid1 covid_positive, chi2 column
tabulate bb_bCovid1 covid_positive, chi2 column
tabulate aad_bCovid1 covid_positive, chi2 column
tabulate ccb_bCovid1 covid_positive, chi2 column

gen anticoagplat_bCovid1 = 1 if asa_bCovid1==1| p2y12inh_bCovid1==1| warf_bCovid1==1| doac_bCovid1==1| heparin_bCovid1==1| bivarud_bCovid1==1
recode anticoagplat_bCovid1(.=0)
tabulate anticoagplat_bCovid1 covid_positive, chi2 column

gen immsup_bCovid1 = 1 if chemo_bCovid1==1| immunosup_bCovid1==1 |hydro_bCovid1==1| steroid_bCovid1==1| antiretrov_bCovid1==1
recode immunisup_bCovid1(.=0)
tabulate immsup_bCovid1 covid_positive, chi2 column
tabulate chemo_bCovid1 covid_positive, chi2 column
tabulate immunosup_bCovid1 covid_positive, chi2 column
tabulate hydro_bCovid1 covid_positive, chi2 column
tabulate steroid_bCovid1 covid_positive, chi2 column
tabulate antiretrov_bCovid1 covid_positive, chi2 column

clonevar covidwhy = covid1why
replace covidwhy = covid2why if covid1==2 & covid2==1 & covid2why !=.

clonevar covidwhy = covid1why
replace covidwhy = covid2why if covid1==2 & covid2==1 & covid2why !=.
tabulate covidwhy covid_positive, chi2 column
tabulate covid1test covid_positive, chi2 column

clonevar covid_fever = covid1_fever
replace covid_fever = covid2_fever if covid1==2 & covid2==1 & covid2_fever !=.

clonevar covid_fatigue = covid1_fatigue
replace covid_fatigue = covid2_fatigue if covid1==2 & covid2==1 & covid2_fatigue !=.

clonevar covid_aches = covid1_aches
replace covid_aches = covid2_aches if covid1==2 & covid2==1 & covid2_aches !=.
tabulate covid_aches covid_positive, chi2 column

clonevar covid_nose = covid1_nose
replace covid_nose = covid2_nose if covid1==2 & covid2==1 & covid2_nose !=.
tabulate covid_nose covid_positive, chi2 column

clonevar covid_cough = covid1_cough
replace covid_cough = covid2_cough if covid1==2 & covid2==1 & covid2_cough !=.
tabulate covid_cough covid_positive, chi2 column

clonevar covid_SOB = covid1_SOB
replace covid_SOB = covid2_SOB if covid1==2 & covid2==1 & covid2_SOB !=.
tabulate covid_SOB covid_positive, chi2 column

clonevar covid_taste = covid1_taste
replace covid_taste = covid2_taste if covid1==2 & covid2==1 & covid2_taste !=.
tabulate covid_taste covid_positive, chi2 column

clonevar covid_nausia = covid1_nausia
replace covid_nausia = covid2_nausia if covid1==2 & covid2==1 & covid2_nausia !=.
tabulate covid_nausia covid_positive, chi2 column

clonevar covid_anorexia = covid1_anorexia
replace covid_anorexia = covid2_anorexia if covid1==2 & covid2==1 & covid2_anorexia !=.
tabulate covid_anorexia covid_positive, chi2 column

clonevar covid_diarrhea = covid1_diarrhea
replace covid_diarrhea = covid2_diarrhea if covid1==2 & covid2==1 & covid2_diarrhea !=.
tabulate covid_diarrhea covid_positive, chi2 column

clonevar covid_headache = covid1_headache
replace covid_headache = covid2_headache if covid1==2 & covid2==1 & covid2_headache !=.
tabulate covid_headache covid_positive, chi2 column

clonevar covid_confusion = covid1_confusion
replace covid_confusion = covid2_confusion if covid1==2 & covid2==1 & covid2_confusion !=.
tabulate covid_confusion covid_positive, chi2 column

clonevar covid_chest = covid1_chest
replace covid_chest = covid2_chest if covid1==2 & covid2==1 & covid2_chest !=.
tabulate covid_chest covid_positive, chi2 column

clonevar covid_othersxs = covid1_othersxs
replace covid_othersxs = covid2_othersxs if covid1==2 & covid2==1 & covid2_othersxs !=.
tabulate covid_othersxs covid_positive, chi2 column

tab covid1 if covid2==1
tab covid1 if covid2==2
gen time_between_Covid_epis = covid2date - covid1date

list time_between_Covid_epis if covid1==1 & covid2==1 & time_between_Covid_epis!=.
sum time_between_Covid_epis if covid1==1 & covid2==1 &  time_between_Covid_epis >30

***reinfection and two covid episodes
gen reinfection = 1 if covid1==1 & covid2==1 &  time_between_Covid_epis > 30

gen pos_after_neg = 1 if covid1==2 & covid2==1 &time_between_Covid_epis>=14 & time_between_Covid_epis!=.

sum time_between_Covid_epis if covid1==1 & covid2==2 &  time_between_Covid_epis !=. & time_between_Covid_epis >30

tab pos_after_neg

sum time_between_Covid_epis if pos_after_neg==1
gen neg_after_pos = 1 if covid1==1 & covid2==2 &  time_between_Covid_epis !=. & time_between_Covid_epis >30

sum time_between_Covid_epis if neg_after_pos ==1

***outcomes
clonevar coviddate= covid1date
replace coviddate=covid2date if pos_after_neg==1

clonevar outcomedate = end_fu if review_outcome==0
replace outcomedate = deathdate if review_outcome ==1
replace outcomedate = datehf1 if review_outcome ==1 & outcomedate ==.
replace outcomedate = stemi1 if review_outcome ==1 & outcomedate ==.
replace outcomedate = nstemidate1 if review_outcome ==1 & outcomedate ==.
replace outcomedate = strokdate1 if review_outcome ==1 & outcomedate ==.
replace outcomedate = arrdate1 if review_outcome ==1 & outcomedate ==.
replace outcomedate = admitdate1 if review_outcome ==1 & outcomedate ==.
replace outcomedate = icudate1 if review_outcome ==1 & outcomedate ==.
replace outcomedate = datehf2 if review_outcome ==1 & outcomedate ==.
replace outcomedate = stemi2 if review_outcome ==1 & outcomedate ==.
replace outcomedate = nstemidate2 if review_outcome ==1 & outcomedate ==.
replace outcomedate = strokdate2 if review_outcome ==1 & outcomedate ==.
replace outcomedate = arrdate2 if review_outcome ==1 & outcomedate ==.
replace outcomedate = admitdate2 if review_outcome ==1 & outcomedate ==.
replace outcomedate = icudate2 if review_outcome ==1 & outcomedate ==.
replace outcomedate = end_fu if review_outcome ==1 & outcomedate ==.

sum outcomedate
gen ttoutcome = outcomedate - coviddate
sum ttoutcome
replace ttoutcome = ttoutcome +1

***November 11 2021 cleaning outcomes
***transformed text of admission diagnosis and "other" outcomes into CVD yes-no.

***Primary outcome 
gen outcome1 = 1 if ahf_Covid1 ==1 | stemi_Covid1==1 | nstemi_Covid1==1 | stroke_covid1==1 | icu_Covid1==1 | scd_Covid1==1 | cvddeath_Covid1==1 | noncarddeath_Covid1==1 | endocard_Covid1==1 | dvt_Covid1==1 | akd_Covid1==1 | sca_Covid1==1
recode outcome1 (.=1) if otherCVDoutcome1==1
recode outcome1 (.=1) if troponin1>1 & troponin1 !=.
recode outcome1 (.=1) if bnp1>500 & bnp1 !=.

recode outcome1 (.=1) if  nstemi_Covid2==1 | stroke_covid2==1 | icu_Covid2==1 | scd_Covid2==1 | cvddeath_Covid2==1 | noncarddeath_Covid2==1 | endocard_Covid2==1 | dvt_Covid2==1 | akd_Covid2==1 | sca_Covid2==1 &pos_after_neg ==1
recode outcome1 (.=1) if otherCVDoutcome2==1 & pos_after_neg ==1
recode outcome1 (.=1) if troponin2>1 & troponin2 !=. & pos_after_neg ==1
recode outcome1 (.=1) if otherCVDoutcome2==1 & pos_after_neg ==1
recode outcome1 (.=1) if troponin2>1 & troponin2 !=. & pos_after_neg ==1
recode outcome1 (.=1) if bnp2>500 & bnp2 !=. & pos_after_neg ==1


label variable outcome1date "date of primary outcome"
label variable outcome2date "date of secondary outcome"
label variable outcome1 "primary outcome"
replace outcome1date = datehf1 if datehf1!=.
replace outcome1date = stemi1 if stemi1 !=.
replace outcome1date = nstemidate1 if nstemidate1 !=.
replace outcome1date = strokdate1 if strokdate1 !=. & outcome1date > strokdate1
replace outcome1date = icudate1 if icudate1 !=. & outcome1date > icudate1
replace outcome1date = arrdate1 if arrdate1 !=. & outcome1date > arrdate1 & sca_Covid1==1
replace outcome1date = admitdate1 if admitdate1 !=. & outcome1date > admitdate1 &  admtdx1_CVD ==1
replace outcome1date = admitdate1 if admitdate1 !=. & outcome1date > admitdate1 &  otherCVDoutcome1 ==1
replace outcome1date = datehf2 if datehf2 !=. & pos_after_neg ==1
replace outcome1date = stemi2 if stemi2 !=. & pos_after_neg ==1
replace outcome1date = nstemidate2 if nstemidate2 !=. & pos_after_neg ==1
replace outcome1date = strokdate2 if strokdate2 !=. & pos_after_neg ==1
replace outcome1date = arrdate2 if arrdate2 !=. & pos_after_neg ==1 & sca_Covid2==1
replace outcome1date = admitdate2 if admitdate2 !=. & pos_after_neg ==1 & admtdx2_CVD ==1
replace outcome1date = admitdate2 if admitdate2 !=. & pos_after_neg ==1 & otherCVDoutcome2 ==1
replace outcome1date = icudate2 if icudate2 !=. & pos_after_neg ==1
recode outcome1 (.=1) if admtdx1_CVD==1 & admtdx1_CVD !=.
recode outcome1 (.=1) if admtdx2_CVD==1 & admtdx2_CVD !=. &pos_after_neg ==1


gen ttoutcome1 = outcome1date - coviddate
replace ttoutcome1 =ttoutcome1*(-1) if ttoutcome1 <0
replace ttoutcome1 =ttoutcome1+1

label variable covid_positive "covid_positive"
label define covid_positive 0 "Covid19-Negative" 1 "Covid19-Positive"
label values covid_positive covid_positive

***unadjusted comprison by outcome1
ttest agey, by(outcome1) unequal
tabulate sex outcome1, chi2 column
tabulate whiteNH outcome1, chi2 column
tabulate insurance outcome1, chi2 column
tabulate healthy outcome1, chi2 column
tabulate cvdHx outcome1, chi2 column
tabulate nomeds_bCovid1 outcome1, chi2 column
tabulate covidadmit1 outcome1, chi2 column
tabulate covidadmit1 outcome1, chi2 column
tabulate icucovid1 outcome1, chi2 column
tabulate icucovid1 outcome1, nolab
tabulate icucovid1 outcome1, chi2 column





***survival analysis for primary outcome
stset ttoutcome, failure(outcome1==1)
stcox covid_positive
estat phtest, det

sts graph, by(covid_positive)
sts test covid_positive, logrank
***attributable risk
stir covid_positive

stcox covid_positive

** adjusted Cox model 1
stcox covid_positive agey sex whiteNH insurance covidwhy
estat phtest, det

**adjusted Cox model 2
stcox covid_positive agey sex whiteNH insurance covidwhy cvdHx cerebrovascHx liverHx diabetesHx thrombHx immunHx nomeds_bCovid1
estat phtest, det

***treatment effect exploratory analysis
stteffects ipw (covid_positive agey sex whiteNH insurance covidwhy)(agey sex whiteNH insurance covidwhy)
stteffects ipw (covid_positive agey sex whiteNH insurance covidwhy)(agey sex whiteNH insurance covidwhy), atet

stteffects ipw (covid_positive agey sex whiteNH insurance covidwhy cvdHx cerebrovascHx liverHx diabetesHx thrombHx immunHx nomeds_bCovid1)(agey sex whiteNH insurance covidwhy cvdHx cerebrovascHx liverHx diabetesHx thrombHx immunHx nomeds_bCovid1)
teoverlap, ptlevel(1) tlevels(0 1)
tebalance summarize
tebalance overid

***final model for primary outcome1
stteffects ipw (covid_positive agey sex whiteNH insurance covidwhy cvdHx respHx cerebrovascHx kidneyHx liverHx diabetesHx thrombHx immunHx addict endocrHx bloodHx sysdisHx nomeds_bCovid1 raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covid_fever covid_fatigue covid_aches covid_nose covid_cough covid_SOB covid_taste covid_nausia covid_headache )(agey sex whiteNH insurance covidwhy cvdHx respHx cerebrovascHx liverHx kidneyHx diabetesHx thrombHx immunHx addict endocrHx bloodHx sysdisHx nomeds_bCovid1 raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covid_fever covid_fatigue covid_aches covid_nose covid_cough covid_SOB covid_taste covid_nausia covid_headache ), atet
teoverlap, ptlevel(1) tlevels(0 1)
tebalance summarize
tebalance overid
predict ps1, ps tlevel(1)
summarize ps1 if covid_positive== 1
summarize ps1 if covid_positive==0



*** did not use ATE estimators because overlap asumption was violated
stteffects ipw (covid_positive agey sex whiteNH insurance covidwhy cvdHx respHx cerebrovascHx kidneyHx liverHx diabetesHx thrombHx immunHx addict endocrHx bloodHx sysdisHx nomeds_bCovid1 raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covid_fever covid_fatigue covid_aches covid_nose covid_cough covid_SOB covid_taste covid_nausia covid_headache )(agey sex whiteNH insurance covidwhy cvdHx respHx cerebrovascHx liverHx kidneyHx diabetesHx thrombHx immunHx addict endocrHx bloodHx sysdisHx nomeds_bCovid1 raasmed_bCovid1 avnodemed_bCovid1 anticoagplat_bCovid1 immsup_bCovid1 covid_fever covid_fatigue covid_aches covid_nose covid_cough covid_SOB covid_taste covid_nausia covid_headache )

***secondary outcome all-cause death
replace deathdate = end_fu if dead==0
gen ttdeath = deathdate - covid1date
replace ttdeath = deathdate - covid2date if pos_after_neg ==1

stset ttdeath, failure(dead==1) scale(1)
sts graph, by(covid_positive) risktable risktable(, failevents) tmax(520) tmin(0)
