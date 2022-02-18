use "CONFIDENTIAL_pos_retests_merged.dta"
*** adjusted preventable fraction
logistic  hosp_omicron i.sex c.age_in_yrsx  i.wave_pos c.time i.vaccine i.sympt_omicron
pwcompare wave_pos vaccine, effects
logistic  hosp_omicron i.sex c.age_in_yrsx  i.initial_status c.time i.vaccine i.sympt_omicron
di 100*(1-   .7059212 )

logistic  icu i.sex c.age_in_yrsx  i.wave_pos c.time i.vaccine i.sympt_omicron
pwcompare wave_pos vaccine, effects
logistic  icu i.sex c.age_in_yrsx  i.initial_status c.time i.vaccine i.sympt_omicron

