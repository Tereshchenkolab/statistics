use "data file in your data folder"

gen GFRdyn = gfrm48 - blgfr
gen GFRdyn24 = gfrm24 - blgfr
replace GFRdyn = GFRdyn24 if GFRdyn==.
sum GFRdyn blgfr
drop GFRdyn24


***relative eGFR change normalized by baseline eGFR (expressed as percentage)
gen GFRdynrel = 100*GFRdyn/blGFR
histogram GFRdynrel

xtile qGFRdynrel = GFRdynrel, nquantiles(3)
tab qGFRdynrel

***Table 1 unadjusted comparison by tertiles of relative eGFR change
by qGFRdynrel, sort : summarize GFRdynrel, detail
oneway blbmi qGFRdynrel, tabulate
oneway bv2sbp qGFRdynrel, tabulate
oneway bv2dbp qGFRdynrel, tabulate
oneway achol qGFRdynrel, tabulate
oneway blGFR qGFRdynrel, tabulate
oneway apotas qGFRdynrel, tabulate
oneway sbpdyn qGFRdynrel, tabulate
oneway dbpdyn qGFRdynrel, tabulate
tabulate male qGFRdynrel, chi2 column
tabulate black qGFRdynrel, chi2 column
tabulate Midwest qGFRdynrel, chi2 column
tabulate cursmk qGFRdynrel, chi2 column
tabulate lvhecgecho qGFRdynrel, chi2 column
tabulate hdllt35 qGFRdynrel, chi2 column
tabulate diabetes qGFRdynrel, chi2 column
tabulate mistroke qGFRdynrel, chi2 column
tabulate hxcabg qGFRdynrel, chi2 column
tabulate blcvd qGFRdynrel, chi2 column
tabulate BLMEDS qGFRdynrel, chi2 column

**** linear regression models minimally adjusted

regress GFRdynrel c.age i.male i.ETHNIC
regress GFRdynrel blbmi c.age i.male i.ETHNIC
regress GFRdynrel bv2sbp c.age i.male i.ETHNIC
regress GFRdynrel bv2dbp c.age i.male i.ETHNIC
regress GFRdynrel mistroke c.age i.male i.ETHNIC
regress GFRdynrel hxcabg c.age i.male i.ETHNIC
regress GFRdynrel diabetes c.age i.male i.ETHNIC
regress GFRdynrel hdllt35 c.age i.male i.ETHNIC
regress GFRdynrel achol c.age i.male i.ETHNIC
regress GFRdynrel aspirin c.age i.male i.ETHNIC
regress GFRdynrel apotas c.age i.male i.ETHNIC
regress GFRdynrel blGFR c.age i.male i.ETHNIC
regress GFRdynrel lvhecgecho c.age i.male i.ETHNIC
regress GFRdynrel cursmk c.age i.male i.ETHNIC
regress GFRdynrel bl_meds c.age i.male i.ETHNIC
regress GFRdynrel blcvd c.age i.male i.ETHNIC
regress GFRdynrel i.GEOREGN c.age i.male i.ETHNIC





***fully adjusted mediation analysis

paramed chf , avar( dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(0) yreg(logistic) mreg(linear) boot reps(500) seed(1234)


paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(0) yreg(logistic) mreg(linear) boot reps(500) seed(1234)


paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(0) yreg(logistic) mreg(linear) boot reps(500) seed(1234)


***controlled direct effect Lisinopril 
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West  sbpdyn dbpdyn) a0(0) a1(1) m(-40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)

***controlled direct effect amlodipine
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)


***controlled direct effect doxazosin
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed chf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)



***fully adjusted mediation analysis for hospitalized or fatal HF outcome

paramed ochf , avar( dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(0) yreg(logistic) mreg(linear) boot reps(500) seed(1234)


paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(0) yreg(logistic) mreg(linear) boot reps(500) seed(1234)


paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(0) yreg(logistic) mreg(linear) boot reps(500) seed(1234)


***controlled direct effect Lisinopril
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West  sbpdyn dbpdyn) a0(0) a1(1) m(-40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(lis) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)

***controlled direct effect amlodipine
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(aml) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)


***controlled direct effect doxazosin
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(-50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(10) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(20) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(30) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(40) yreg(logistic) mreg(linear) boot reps(500) seed(1234)
paramed ochf , avar(dox) mvar( GFRdynrel ) cvars(age male whiteNH whiteH black bl_meds blbmi bv2sbp bv2dbp mistroke hxcabg blcvd diabetes  hdllt35 lvhecgecho cursmk llt aspirin achol blGFR  apotas East Midwest South West sbpdyn dbpdyn ) a0(0) a1(1) m(50) yreg(logistic) mreg(linear) boot reps(500) seed(1234)





