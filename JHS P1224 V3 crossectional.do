***STATA code developed by Larisa Tereshchenko <tereshch@ohsu.edu> 
***for analysis of the JHS approved manuscript proposal P1224
***January 2020
***use STATA 16
 
use "data file in your computer"

****preparation 
***calculate frontal QRS-T angle
gen fQRS_T = abs(R-T)
sum fQRS_T
replace fQRS_T = 360 - fQRS_T if fQRS_T>180
sum fQRS_T

***unadjusted analyses

ttest age, by(male) unequal
ttest weight , by(male) unequal
ttest height , by(male) unequal
ttest BMI , by(male) unequal
ttest whr , by(male) unequal
tabulate BMI3cat male, chi2 column
ttest bsa , by(male) unequal
tabulate alc male, chi2 column
tabulate HTN male, chi2 column
ttest sbp , by(male) unequal
ttest dbp , by(male) unequal
ttest HbA1c , by(male) unequal
ttest FPG , by(male) unequal
tabulate Diabetes male, chi2 column
ttest ldl , by(male) unequal
ttest hdl , by(male) unequal
ttest trigs , by(male) unequal
ttest totchol , by(male) unequal
tabulate strokeHx male, chi2 column
tabulate CHDHx male, chi2 column
tabulate CVD male, chi2 column
tabulate recruit male, chi2 column
tabulate menopause male, chi2 column
tabulate everSmoker male, chi2 column
tabulate FPG3cat male, chi2 column
tabulate HbA1c3cat male, chi2 column
ttest HbA1cIFCC , by(male) unequal
ttest HbA1cIFCC3cat , by(male) unequal
ttest hsCRP , by(male) unequal
ranksum hsCRP, by(male) porder
by male, sort : summarize hsCRP, detail
 summarize hsCRP, detail
ttest eGFRckdepi , by(male) unequal
ttest eGFRmdrd , by(male) unequal
tabulate DialysisEver male, chi2 column
tabulate CKDHx male, chi2 column
tabulate PA3cat male, chi2 column
tabulate MIHx male, chi2 column
tabulate CardiacProcHx male, chi2 column
tabulate income male, chi2 column
label define PA3cat 0 "poor" 1 "intermed" 2 "ideal"
label values PA3cat PA3cat
tabulate PA3cat male, chi2 column
gen MKincome75 = 1 if  income > 10
recode MKincome75 (.=0)
tab MKincome75 income, mis
tabulate MKincome75 male, chi2 column

clonevar mbeat3=mbeat
recode mbeat3 (2=1) (3=1) (4=1) (5=1) (9=1)
tab mbeat3
recode mbeat3 (6=2) (7=2) (8=3)
tab mbeat3
label define mbeat3 1 "NS" 2 "VP" 3 "AF"
label values mbeat3 mbeat3
tab mbeat3

ttest ecgHR , by(male) unequal
ttest QRS , by(male) unequal
ttest QTcBaz , by(male) unequal
ttest QTcFram , by(male) unequal
ttest QTcHod , by(male) unequal
ttest QTcFrid , by(male) unequal
ttest CV , by(male) unequal
tabulate mbeat3 male, chi2 column
ttest areaqrs_uvms , by(male) unequal
ttest peakqrsmagnitude_uv , by(male) unequal
ttest areat_uvms , by(male) unequal
ttest peaktmagnitude_uv , by(male) unequal
ttest wilsonsvg_uvms , by(male) unequal
ttest peaksvgmagnitude_uv , by(male) unequal
ttest saiqrst , by(male) unequal
ttest aucofqtvectormagnitude_uvms , by(male) unequal

***Transformation of azimuth variables 
gen traSVGaz = (areasvgazimuth_deg*2)+360
gen trpSVGaz = (peaksvgazimuth_deg*2)+360
gen traQRSaz = (areaqrsazimuth_deg*2)+360
gen trpQRSaz = (peakqrsazimuth_deg*2)+360
gen traTaz = (areatazimuth_deg*2)+360
gen trpTaz = (peaktazimuth_deg*2)+360

***circular statistics
circ2sam peakqrstangle_deg , by(male)
circcomp peakqrstangle_deg, by(male) detail
circcomp peakqrstangle_deg, det
circ2sam areaqrstangle_deg , by(male)
circcomp areaqrstangle_deg , det
circcomp areaqrstangle_deg , by(male) detail
circ2sam peakqrselevation_deg , by(male)
circcomp peakqrselevation_deg , by(male) detail
circcomp peakqrselevation_deg , detail
circ2sam areaqrselevation_deg , by(male)
circcomp areaqrselevation_deg , by(male) detail
circcomp areaqrselevation_deg ,  detail
circ2sam peaktelevation_deg , by(male)
circcomp peaktelevation_deg , by(male) detail
circcomp peaktelevation_deg , detail
circ2sam areatelevation_deg , by(male)
circcomp areatelevation_deg , by(male) detail
circcomp areatelevation_deg ,  detail
circ2sam peaksvgelevation_deg , by(male)
circcomp peaksvgelevation_deg , by(male) detail
circcomp peaksvgelevation_deg ,  detail
circ2sam areasvgelevation_deg , by(male)
circcomp areasvgelevation_deg , by(male) detail
circcomp areasvgelevation_deg , detail


*****regression analysis

mixed peakqrstangle_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress peakqrstangle_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed areaqrstangle_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress areaqrstangle_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed saiqrst i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress saiqrst i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed aucofqtvectormagnitude_uvms i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress aucofqtvectormagnitude_uvms i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed wilsonsvg_uvms i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress wilsonsvg_uvms i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed peaksvgmagnitude_uv i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress peaksvgmagnitude_uv i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed peaksvgelevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress peaksvgelevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed areasvgelevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress areasvgelevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed trpSVGaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress trpSVGaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

***mixed model random intercept
mixed traSVGaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed ecgHR i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 || family:
regress ecgHR i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed QTcBaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress QTcBaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

***mixed model random intercept
mixed QRS i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed CV i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress CV i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed peaktelevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress peaktelevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed areatelevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress areatelevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed peaktmagnitude_uv i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress peaktmagnitude_uv i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed areat_uvms i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress areat_uvms i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed areaqrs_uvms i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress areaqrs_uvms i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed peakqrsmagnitude_uv i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress peakqrsmagnitude_uv i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed peakqrselevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress peakqrselevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed areaqrselevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress areaqrselevation_deg i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

****mixed model random intercept
mixed trpTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

*** mixed model random intercept
mixed traTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed traQRSaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress traQRSaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

mixed trpQRSaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
regress trpQRSaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms
margins male#CVD
marginsplot, recast (scatter) xdimension(male) xlabel(,) xscale(range(0.5 2.5))

****testing mixed models
xtreg traTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base re
estimates store GLS
xtreg traTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base be
estimates store Between
xtreg traTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base fe
estimates store Within
estimates table GLS Between Within, base
hausman Within GLS


xtreg trpTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base re
estimates store GLS
xtreg trpTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base be
estimates store Between
xtreg trpTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base fe
estimates store Within
estimates table GLS Between Within, base
hausman Within GLS

xtreg traSVGaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base re
estimates store GLS
xtreg traSVGaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base be
estimates store Between
xtreg traSVGaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base fe
estimates store Within
estimates table GLS Between Within, base
hausman Within GLS

xtreg QRS i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base re
estimates store GLS
xtreg QRS i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base be
estimates store Between
xtreg QRS i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms, base fe
estimates store Within
estimates table GLS Between Within, base
hausman Within GLS

***plot family effects
mixed traSVGaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
predict re_hat, reffects
predict re_se, reses
bysort family: gen graphe = _n==1
sort re_hat
gen rank = sum(graphe)
serrbar re_hat re_se rank if graphe, scale(1.96) mvopts(mlabel(family) msymbol(none) mlabpos(0) mlabsize(vsmall) mlabcolor(black) title(Random Effects with 95% Prediction intervals) xtitle(Rank) ytitle(Family Effects) legend(off) yline(0))
serrbar re_hat re_se rank if graphe, scale(1.96)  mlabcolor(black) title(Random Effects with 95% Prediction intervals) xtitle(Rank) ytitle(Family Effects) legend(off) yline(0)

mixed traTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
predict re_hat, reffects
predict re_se, reses
bysort family: gen graphe = _n==1
sort re_hat
gen rank = sum(graphe)
serrbar re_hat re_se rank if graphe, scale(1.96)  mlabcolor(black) title(Random Effects with 95% Prediction intervals) xtitle(Rank) ytitle(Family Effects) legend(off) yline(0)

mixed trpTaz i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
predict re_hat, reffects
predict re_se, reses
bysort family: gen graphe = _n==1
sort re_hat
gen rank = sum(graphe)
serrbar re_hat re_se rank if graphe, scale(1.96)  mlabcolor(black) title(Random Effects with 95% Prediction intervals) xtitle(Rank) ytitle(Family Effects) legend(off) yline(0)

mixed QRS i.male##i.CVD c.age i.recruit i.alc c.weight c.height c.waist c.BMI c.sbp c.dbp i.HTN c.HbA1c c.FPG i.Diabetes c.ldl c.hdl c.trigs c.totchol i.menopause c.hip c.bsa c.hsCRP c.eGFRckdepi i.DialysisEver i.CKDHx  i.PA3cat c.whr i.MKincome75 i.mbeat3 c.rrinterval_ms || family:
predict re_hat, reffects
predict re_se, reses
bysort family: gen graphe = _n==1
sort re_hat
gen rank = sum(graphe)
serrbar re_hat re_se rank if graphe, scale(1.96)  mlabcolor(black) title(Random Effects with 95% Prediction intervals) xtitle(Rank) ytitle(Family Effects) legend(off) yline(0)


***prepare plots for publication

graph combine aSVGaz_mixed.gph FamilyEff_aSVGaz.gph QRS_mixed.gph FamilyEff_QRS.gph,  imargin(1 1 1 1)  rows(2) cols(2)iscale(*.8)
graph combine aTaz_mixed.gph FamilyEff_aTaz.gph pTaz_mixed.gph FamilyEff_pTaz.gph,  imargin(1 1 1 1)  rows(2) cols(2)iscale(*.8)
graph combine WilsonSVG.gph pSVGmag.gph SAI.gph VM_QTi.gph,  imargin(1 1 1 1)  rows(2) cols(2)iscale(*.8)
graph combine pQRSmag.gph QRSarea.gph pTmag.gph Tarea.gph,  imargin(1 1 1 1)  rows(2) cols(2)iscale(*.8)
graph combine pSVGaz.gph QTcBaz.gph pSVGel.gph aSVGel.gph,  imargin(1 1 1 1)  rows(2) cols(2)iscale(*.8)
graph combine pQRSel.gph aQRSel.gph pTel.gph aTel.gph,  imargin(1 1 1 1)  rows(2) cols(2)iscale(*.8)
graph combine pQRSaz.gph aQRSaz.gph CornellV.gph heartrate.gph,  imargin(1 1 1 1)  rows(2) cols(2)iscale(*.8)
graph combine pQRS_T.gph aQRS_T.gph ,  imargin(1 1 1 1)  ycom xcom rows(1) cols(2)




