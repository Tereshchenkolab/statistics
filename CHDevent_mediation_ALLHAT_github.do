***Analysis of the ALLHAT data provided by BioLINCC
***by Larisa Tereshchenko <tereshl@ccf.org>
***November 2023
***use STATA 18.0
***


tab rzgroup, nolab
gen chlor = 1 if RZGROUP == 2
recode chlor (.=0) if RZGROUP ==1 | RZGROUP ==3
gen lisin = 1 if RZGROUP ==4
recode lisin (.=0) if chlor ==0
tab lisin RZGROUP , mis
recode lisin (0=.) if RZGROUP ==2
tab lisin RZGROUP , mis
tab chlor RZGROUP , mis
gen htnmeds = 1 if RZGROUP ==2 | RZGROUP ==4
recode htnmeds (.=0)


***define mediator variables

gen AMI_revasc = 1 if EP_CHD==1 & CRVSC==1
recode  AMI_revasc (.=0)
recode  AMI_revasc (1=0) if DYCHD > DYCHF | DYCRVSC > DYCHF

gen AMI_med = 1 if EP_CHD==1 & CRVSC==2
recode  AMI_med (.=0)
recode  AMI_med (1=0) if DYCHD > DYCHF
recode  AMI_med (0=1) if evQED==1 & CRVSC==2
tab AMI_revasc AMI_med

gen ang_revasc = 1 if HANG==1 & CRVSC==1
recode  ang_revasc (.=0)
recode  ang_revasc (1=0) if DYHANG > DYCHF | DYCRVSC > DYCHF
recode  ang_revasc (0=1)if ANG==1 & CRVSC==1
recode  ang_revasc (1=0) if DYANG > DYCHF | DYCRVSC > DYCHF

gen ang_med = 1 if HANG==1 & CRVSC==2
recode  ang_med (.=1)if ANG==1 & CRVSC==2
recode  ang_med (1=0) if DYANG > DYCHF | DYCRVSC > DYCHF
recode  ang_med (1=0) if DYHANG > DYCHF | DYCRVSC > DYCHF
recode  ang_med (.=0)
tab ang_revasc ang_med, mis
tab ang_revasc ang_med, mis
tab ang_revasc AMI_revasc , mis
tab AMI_med ang_med , mis

gen anyMIang = 1 if AMI_revasc==1| AMI_med==1| ang_revasc==1| ang_med==1
recode anyMIang (.=0)
tab anyMIang

gen revasc = 1 if ang_revasc==1 | AMI_revasc ==1
gen meds = 1 if ang_med==1 | AMI_med ==1
recode meds (.=0)
recode revasc (.=0)
tab anyMIang  revasc
tab anyMIang  meds


***covariates
sum AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN WHITE hisp MALE east midwest south west canada prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK

gen hisp = 1 if HISPANIC==1
recode hisp (.=0)
tab hisp HISPANIC

gen blmed = 1 if BLMEDS2==1
recode blmed (.=0)

tab GEOREGN, mis
gen east=1 if GEOREGN==1
recode east(.=0)
gen midwest=1 if GEOREGN==2
recode midwest (.=0)
gen south=1 if GEOREGN==3
recode south (.=0)
gen west=1 if GEOREGN==4
recode west (.=0)
gen canada=1 if GEOREGN==5
recode canada (.=0)
gen prico=1 if GEOREGN==6
recode prico (.=0)



gen sbpdyn = SBP6M72 - BV2SBP
gen dbpdyn = DBP6M72 - BV2DBP
gen sbpdyn60 = SBP6M60 - BV2SBP
gen dbpdyn60 = DBP6M60 - BV2DBP
gen sbpdyn48 = SBP6M48 - BV2SBP
gen dbpdyn48 = DBP6M48 - BV2DBP
gen sbpdyn36 = SBP6M36 - BV2SBP
gen dbpdyn36 = DBP6M36 - BV2DBP
gen sbpdyn24 = SBP6M24 - BV2SBP
gen dbpdyn24 = DBP6M24 - BV2DBP
gen sbpdyn12 = SBP6M12 - BV2SBP
gen dbpdyn12 = DBP6M12 - BV2DBP
replace sbpdyn = sbpdyn60 if sbpdyn==.
replace sbpdyn = sbpdyn48 if sbpdyn==.
replace sbpdyn = sbpdyn36 if sbpdyn==.
replace sbpdyn = sbpdyn24 if sbpdyn==.
replace sbpdyn = sbpdyn12 if sbpdyn==.
replace dbpdyn = dbpdyn60 if dbpdyn==.
replace dbpdyn = dbpdyn48 if dbpdyn==.
replace dbpdyn = dbpdyn36 if dbpdyn==.
replace dbpdyn = dbpdyn24 if dbpdyn==.
replace dbpdyn = dbpdyn12 if dbpdyn==.
sum sbpdyn dbpdyn
replace sbpdyn = 0 if sbpdyn==.
replace dbpdyn = 0 if dbpdyn==.
drop sbpdyn60 - dbpdyn12
sum sbpdyn dbpdyn


***Table 1
tab anyMIang
ttest AGE, by(anyMIang) unequal
tabulate RACE anyMIang, chi2 column
tabulate BLACK anyMIang, chi2 column
tabulate WHITE anyMIang, chi2 column
tabulate hisp anyMIang, chi2 column
tabulate MALE anyMIang, chi2 column
tabulate blmed anyMIang, chi2 column
tabulate east anyMIang, chi2 column
tabulate midwest anyMIang, chi2 column
tabulate south anyMIang, chi2 column
tabulate west anyMIang, chi2 column
tabulate canada anyMIang, chi2 column
tabulate prico anyMIang, chi2 column

ttest AGE if anyMIang==1, by(revasc) unequal
tabulate BLACK revasc if anyMIang==1, chi2 column
tabulate WHITE revasc if anyMIang==1, chi2 column
tabulate hisp revasc if anyMIang==1, chi2 column
tabulate MALE revasc if anyMIang==1, chi2 column
tabulate east revasc if anyMIang==1, chi2 column
tabulate midwest  revasc if anyMIang==1, chi2 column
tabulate west revasc if anyMIang==1, chi2 column
tabulate south revasc if anyMIang==1, chi2 column
tabulate canada revasc if anyMIang==1, chi2 column
tabulate prico  revasc if anyMIang==1, chi2 column
tabulate blmed  revasc if anyMIang==1, chi2 column
tabulate BV2SBP anyMIang, chi2 column
ttest BV2SBP if anyMIang==1, by(revasc) unequal
ttest BV2DBP if anyMIang==1, by(revasc) unequal
ttest sbpdyn if anyMIang==1, by(revasc) unequal
ttest dbpdyn if anyMIang==1, by(revasc) unequal
tabulate ASA  revasc if anyMIang==1, chi2 column
tabulate LLT  revasc if anyMIang==1, chi2 column
tabulate HxMISTROKE  revasc if anyMIang==1, chi2 column
tabulate CABG  revasc if anyMIang==1, chi2 column
tabulate OASCVD  revasc if anyMIang==1, chi2 column
tabulate DIABETES  revasc if anyMIang==1, chi2 column
tabulate HDLLT35  revasc if anyMIang==1, chi2 column
tabulate NeverSMK  revasc if anyMIang==1, chi2 column
tabulate LVH revasc if anyMIang==1, chi2 column


**set-up survival outcomes
stset DYCHFy , failure( CHF ==1) scale(1)
stset DYOCHFy, failure( OCHF ==1) scale(1)

tab anyMIang
clonevar eventCHD = anyMIang
recode eventCHD (1=2) if revasc==1
gen DYCHFy = DYCHF/365.25
stset DYCHFy , failure( CHF ==1) scale(1)
sts graph, by(eventCHD) risktable risktable(, failevents)
sts test eventCHD, logrank
gen DYOCHFy = DYOCHF/365.25
stset DYOCHFy , failure(OCHF ==1) scale(1)
sts graph, cumhaz by(eventCHD) risktable risktable(, failevents)

**Figures
graph bar evQED AMI_med   AMI_revasc ang_revasc, over ( RZGROUP) percentages  stack
sts graph if anyMIang ==0, cumhaz by( RZGROUP )
sts graph if anyMIang ==1, cumhaz by( RZGROUP )
sts graph if meds ==1, cumhaz by( RZGROUP )
sts graph if revasc ==1, cumhaz by( RZGROUP )
graph combine Rx_noCHD_HHF.gph  Rx_CHD_HHF.gph   ,row(1) col(2) ycommon
graph combine Rx_meds_HHF.gph Rx_revasc_HHF.gph ,row(1) col(2) ycommon


***incidence of events
stset DYCHFy , failure( CHF ==1) scale(1)
stdescribe
stir anyMIang
stset DYCHFy , id( STUDYID) failure( CHF ==1) scale(1)
stptime, per(1000)
stptime if anyMIang ==1, per(1000)
stptime if anyMIang ==0, per(1000)
stptime if eventCHD ==0, per(1000)
stptime if eventCHD ==1, per(1000)
stptime if eventCHD ==2, per(1000)
stir revasc if anyMIang ==1


**# Bookmark #1

***note: use Cox regression for mediator. need to exponentiate coefficients
****for symptomatic CHF outcome
stset DYCHFy ,failure( CHF ==1) scale(1)

***primary mediator CHD event at m==1
med4way aml  anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***primary mediator CHD event at m==0
med4way aml  anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader







med4way lisin  anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way lisin  anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





med4way chlor   anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west  prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader



med4way chlor   anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west  prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





***for hospitalized or fatal HF outcome
stset DYOCHFy , failure( OCHF ==1) scale(1)




***primary mediator CHD event at m==1
med4way aml  anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***primary mediator CHD event at m==0
med4way aml  anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader







med4way lisin  anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way lisin  anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





med4way chlor   anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west  prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader



med4way chlor   anyMIang AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west  prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0)bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader













**# Bookmark #2



****two types of mediators (secondary)

med4way lisin revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK , a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way lisin revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK , a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





med4way aml revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way aml revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





med4way chlor revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west  prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way chlor revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west  prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader









med4way lisin meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way lisin meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





med4way aml meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way aml meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader




med4way chlor meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way chlor meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader









***for hospitalized or fatal HF outcome
stset DYOCHFy , failure( OCHF ==1) scale(1)




****two types of mediators (secondary)

med4way lisin revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK , a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way lisin revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN  hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK , a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





med4way aml revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way aml revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





med4way chlor revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west  prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way chlor revasc AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west  prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader









med4way lisin meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way lisin meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader





med4way aml meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way aml meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader




med4way chlor meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(1) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


med4way chlor meds AGE BV2SBP BV2DBP sbpdyn dbpdyn blmed BLACK ASIAN hisp MALE east midwest south west prico HxMISTROKE CABG  OASCVD DIABETES  HDLLT35 LVH  ASA LLT  NeverSMK, a0(0) a1(1) m(0) yreg(cox) mreg(logistic) c(. . . . . 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0) bootstrap seed(99999) fulloutput

estat bootstrap 

*** Test whether the component of the total excess mean survival-time ratio due to controlled direct effect (ereri_cde)
*** is statistically different from the component of the total excess mean survival-time ratio due to pure indirect effect (ereri_pie)
test _b[ereri_cde] = _b[ereri_pie]

***proportion eliminated: how much of the effect of the exposure can be elimiminated/prevented by intervening on mediator
nlcom (_b[ereri_pie]+_b[ereri_intmed]+ _b[ereri_intref])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader

***the overall proportion mediated (op_m) (does not include reference interaction since this is not part of the mediated effect)
nlcom (_b[ereri_pie]+_b[ereri_intmed])/(_b[ereri_cde]+_b[ereri_intref]+_b[ereri_intmed]+_b[ereri_pie]), noheader


***figures 

graph combine  survival_CHF.gph  survival_hospCHF.gph, ycommon

graph bar CDE PE MI if outcome==2, over( Rx)  over(CHD, gap(200)) blabel(bar)
graph combine CHF_proportions.gph HHF_proportions.gph ,row(1) col(2) ycommon
label define CHD 1 "New CHD event" 2 "+ Revascularization" 3 "No Revascularization"
label values CHD CHD
label define Rx 1 "Chl" 2 "Lis" 3 "Aml", replace
label define CHD 1 "New CHD event" 2 "+ Revascul" 3 "No Revascul", replace

graph bar CDEM1 CDEM0 PEM1 PEM0 if outcome==1, over( Rx, gap(20))  over(CHD, gap(100)) blabel(bar)
graph bar CDEM1 CDEM0 PEM1 PEM0 if outcome==2, over( Rx, gap(20))  over(CHD, gap(100)) blabel(bar)




