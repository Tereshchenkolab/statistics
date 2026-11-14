****CV mortality adjudication: rater reliability analysis
***by Larisa Tereshchenko <tereshl@ccf.org>
***November 2026
***StataNow 19.5

***calibration 10 cases

egen n_cv = rowtotal(cvdr1-cvdr7)
generate byte n_noncv = 7 - n_cv
generate byte max_agree_binary = max(n_cv, n_noncv)

**exact binary agreement
generate byte unanimous_binary = (max_agree_binary == 7)
count
local N = r(N)
count if unanimous_binary == 1
local n_unanimous_binary = r(N)
local pct_unanimous_binary = 100 * `n_unanimous_binary' / `N'

display "Unanimous broad CV/non-CV agreement: " ///
    `n_unanimous_binary' " (" %4.1f `pct_unanimous_binary' "%)"
	
***at least 6 of 7 agreed
generate byte agree6_binary = (max_agree_binary >= 6)

count if agree6_binary == 1
local n_agree6_binary = r(N)
local pct_agree6_binary = 100 * `n_agree6_binary' / `N'

display "At least 6 of 7 agreeing: " ///
    `n_agree6_binary' " (" %4.1f `pct_agree6_binary' "%)"
	
generate byte agree5_binary = (max_agree_binary >= 5)
generate byte majority_binary = (max_agree_binary >= 4)
tab majority_binary
generate byte no_majority_binary = (max_agree_binary < 4)
tab no_majority_binary

***pairwise agreementgenerate double pairs_both_cv = n_cv * (n_cv - 1) / 2
generate double pairs_both_cv = n_cv * (n_cv - 1) / 2
generate double pairs_both_noncv = n_noncv * (n_noncv - 1) / 2
generate double pairs_discordant = n_cv * n_noncv

generate double pairs_agree = pairs_both_cv + pairs_both_noncv
generate double pairs_total = 21

quietly summarize pairs_agree, meanonly
local agree_pairs = r(sum)

quietly summarize pairs_total, meanonly
local total_pairs = r(sum)

local pairwise_agreement = 100 * `agree_pairs' / `total_pairs'

display "Overall pairwise agreement: " ///
    %5.1f `pairwise_agreement' "%"
	
	***positive agreement
quietly summarize pairs_both_cv, meanonly
local A = r(sum)

quietly summarize pairs_discordant, meanonly
local D = r(sum)

local positive_agreement = 100 * (2 * `A') / ((2 * `A') + `D')

display "Positive agreement for broad CV death: " ///
    %5.1f `positive_agreement' "%"	
	
	
***negative agreement
quietly summarize pairs_both_noncv, meanonly
local B = r(sum)

local negative_agreement = 100 * (2 * `B') / ((2 * `B') + `D')

display "Negative agreement for non-CV death: " ///
    %5.1f `negative_agreement' "%"

***4-categories
forvalues category = 1/3 {
    generate byte n_cat`category' = 0

    forvalues reviewer = 1/3 {
        replace n_cat`category' = n_cat`category' + ///
            (deathr`reviewer' == `category') if !missing(deathr`reviewer')
    }
}

label variable n_cat1 "Number rating definite CV"
label variable n_cat2 "Number rating probable CV"
label variable n_cat3 "Number rating possible CV"
label variable n_cat4 "Number rating non-CV"

egen max_agree_exact = rowmax(n_cat1-n_cat3)

generate byte unanimous_exact = (max_agree_exact == 3)

count if unanimous_exact == 1
local n_unanimous_exact = r(N)
local pct_unanimous_extab act = 100 * `n_unanimous_exact' / `N'

display "Unanimous exact 4-category agreement: " ///
    `n_unanimous_exact' " (" %4.1f `pct_unanimous_exact' "%)"
	
generate byte agree6_exact = (max_agree_exact >= 6)
generate byte agree5_exact = (max_agree_exact >= 5)
tab agree5_exact
generate byte majority_exact = (max_agree_exact >= 2)
tab majority_exact
generate byte no_majority_exact = (max_agree_exact < 2)
tab no_majority_exact
tab no_majority_binary


***Margin plots: factors associated with disagreement and uncertanty

marginsplot, ///
    recast(scatter) ///
    recastci(rcap) ///
    ytitle("Adjusted probability of reviewer disagreement") ///
    xtitle("Documentation completeness") ///
    title("")
	
logit disagreement ///
    c.age_death10 ///
    i.sex ///
    i.death_loc5, vce(robust) or

margins death_loc5
marginsplot, ///
recast(scatter) ///
    recastci(rcap) ///
    ytitle("Adjusted probability of reviewer disagreement") ///
    xtitle("Place of death")	

***uncertanty predictors

logit death2cat ///
    c.age_death10 ///
    i.sex ///
    i.doc_complete, vce(robust) or

margins doc_complete
marginsplot, ///
recast(scatter) ///
    recastci(rcap) ///
    ytitle("Adjusted probability of CV death attribution uncertainty") ///
    xtitle("Documentation completeness")	


***uncertanty predictors

logit death2cat ///
    c.age_death10 ///
    i.sex ///
    i.death_loc5, vce(robust) or

margins death_loc5
marginsplot, ///
recast(scatter) ///
    recastci(rcap) ///
    ytitle("Adjusted probability of CV death attribution uncertainty") ///
    xtitle("Place of death")		
	
	
*--------------------------------------------------------------------
* Positive and negative agreement for 3 raters
* Variables:
*   cvdr1 = reviewer 1 classification
*   cvdr2 = reviewer 2 classification
*   cvdr3 = reviewer 3 classification
*
* Coding:
*   1 = CV death
*   0 = non-CV death
*--------------------------------------------------------------------

***agreement
kappaetc cvdr1 cvdr2 cvdr3


* Number of nonmissing reviewer classifications per case
egen n_cv_raters = rownonmiss(cvdr1 cvdr2 cvdr3)

* Primary analysis restricted to cases with all 3 ratings
generate byte complete_3ratings = (n_cv_raters == 3)

count if complete_3ratings
display "Cases with all 3 ratings = " r(N)

*--------------------------------------------------------------------
* Count ratings classified as CV and non-CV within each case
*--------------------------------------------------------------------

egen n_cv = rowtotal(cvdr1 cvdr2 cvdr3) if complete_3ratings

generate byte n_noncv = 3 - n_cv if complete_3ratings

*--------------------------------------------------------------------
* Across 3 raters, each case has 3 unique reviewer pairs:
*   Reviewer 1 vs Reviewer 2
*   Reviewer 1 vs Reviewer 3
*   Reviewer 2 vs Reviewer 3
*--------------------------------------------------------------------

* Number of reviewer pairs agreeing on CV death
generate double pairs_both_cv = ///
    n_cv * (n_cv - 1) / 2 if complete_3ratings

* Number of reviewer pairs agreeing on non-CV death
generate double pairs_both_noncv = ///
    n_noncv * (n_noncv - 1) / 2 if complete_3ratings

* Number of reviewer pairs disagreeing on CV vs non-CV
generate double pairs_discordant = ///
    n_cv * n_noncv if complete_3ratings

* Total reviewer pairs per complete case
generate byte pairs_total = 3 if complete_3ratings

* Quality-control check
assert pairs_both_cv + pairs_both_noncv + ///
       pairs_discordant == pairs_total ///
       if complete_3ratings

*--------------------------------------------------------------------
* Sum pair counts across all cases
*--------------------------------------------------------------------

quietly summarize pairs_both_cv if complete_3ratings, meanonly
local A = r(sum)

quietly summarize pairs_both_noncv if complete_3ratings, meanonly
local B = r(sum)

quietly summarize pairs_discordant if complete_3ratings, meanonly
local D = r(sum)

quietly summarize pairs_total if complete_3ratings, meanonly
local T = r(sum)

*--------------------------------------------------------------------
* Agreement calculations
*
* Positive agreement = 2A / (2A + D)
* Negative agreement = 2B / (2B + D)
* Overall pairwise agreement = (A + B) / T
*--------------------------------------------------------------------

local positive_agreement = 100 * (2 * `A') / (2 * `A' + `D')
local negative_agreement = 100 * (2 * `B') / (2 * `B' + `D')
local overall_agreement  = 100 * (`A' + `B') / `T'

display ""
display "Total reviewer pairs             = " %9.0f `T'
display "Pairs agreeing on CV death        = " %9.0f `A'
display "Pairs agreeing on non-CV death    = " %9.0f `B'
display "Discordant reviewer pairs         = " %9.0f `D'
display ""
display "Overall pairwise agreement         = " ///
    %6.2f `overall_agreement' "%"

display "Positive agreement for CV death    = " ///
    %6.2f `positive_agreement' "%"

display "Negative agreement for non-CV death = " ///
    %6.2f `negative_agreement' "%"
	
	
*--------------------------------------------------------------------
* Agreement for 2 raters
*
* Variables:
*   cvdr1 = reviewer 1
*   cvdr2 = reviewer 2
*
* Coding:
*   1 = broad CV death
*   0 = non-CV death
*--------------------------------------------------------------------

* Verify variables and coding
describe cvdr1 cvdr2
tab1 cvdr1 cvdr2, missing

assert inlist(cvdr1, 0, 1, .)
assert inlist(cvdr2, 0, 1, .)

*--------------------------------------------------------------------
* Identify cases with both ratings available
*--------------------------------------------------------------------

capture drop complete_2ratings
generate byte complete_2ratings = ///
    !missing(cvdr1, cvdr2)

count if complete_2ratings == 1

scalar N_complete = r(N)

display "Cases with both ratings = " ///
    %9.0f N_complete

*--------------------------------------------------------------------
* Create the four cells of the paired 2x2 table
*--------------------------------------------------------------------

capture drop both_cv
capture drop both_noncv
capture drop r1_cv_r2_noncv
capture drop r1_noncv_r2_cv
capture drop discordant_pair
capture drop exact_agreement

* A: Both reviewers classified the case as CV
generate byte both_cv = ///
    cvdr1 == 1 & cvdr3 == 1 ///
 

* B: Both reviewers classified the case as non-CV
generate byte both_noncv = ///
    cvdr1 == 0 & cvdr3 == 0 ///
   

* Reviewer 1 classified CV; reviewer 2 classified non-CV
generate byte r1_cv_r2_noncv = ///
    cvdr1 == 1 & cvdr3 == 0 ///
 

* Reviewer 1 classified non-CV; reviewer 2 classified CV
generate byte r1_noncv_r2_cv = ///
    cvdr1 == 0 & cvdr3 == 1 ///
    

* Any disagreement
generate byte discordant_pair = ///
    cvdr1 != cvdr3 ///
    

* Exact agreement
generate byte exact_agreement = ///
    cvdr1 == cvdr3 ///
 

*--------------------------------------------------------------------
* Obtain cell counts
*--------------------------------------------------------------------

quietly count if both_cv == 1
scalar A = r(N)

quietly count if both_noncv == 1
scalar B = r(N)

quietly count if r1_cv_r2_noncv == 1
scalar C = r(N)

quietly count if r1_noncv_r2_cv == 1
scalar E = r(N)

scalar D = C + E
scalar T = A + B + D

*--------------------------------------------------------------------
* Verify counts
*--------------------------------------------------------------------

scalar list N_complete A B C E D T

assert T == N_complete

display ""
display "Both classified CV death       = " %9.0f A
display "Both classified non-CV death   = " %9.0f B
display "Reviewer 1 CV, reviewer 2 non-CV = " %9.0f C
display "Reviewer 1 non-CV, reviewer 2 CV = " %9.0f E
display "Total discordant pairs         = " %9.0f D
display "Total complete pairs           = " %9.0f T

*--------------------------------------------------------------------
* Calculate agreement statistics
*--------------------------------------------------------------------

scalar overall_agreement = 100*(A+B)/T
scalar disagreement_pct = 100*D/T

if (2*A+D) > 0 {
    scalar positive_agreement = 100*(2*A)/(2*A+D)
}
else {
    scalar positive_agreement = .
}

if (2*B+D) > 0 {
    scalar negative_agreement = 100*(2*B)/(2*B+D)
}
else {
    scalar negative_agreement = .
}

*--------------------------------------------------------------------
* Display results
*--------------------------------------------------------------------

display ""
display "Overall observed agreement = " ///
    %6.2f overall_agreement "%"

display "Overall disagreement = " ///
    %6.2f disagreement_pct "%"

display "Positive agreement for CV death = " ///
    %6.2f positive_agreement "%"

display "Negative agreement for non-CV death = " ///
    %6.2f negative_agreement "%"	

	
tab pairs_both_cv 
tab pairs_both_noncv
tab cvdr1 cvdr3
tab CVDdeath cvdeath_old
tab deathr1 deathr2
tab deathr1 deathr3
tab deathr3
tab deathr3 CVDdeath
tab deathr1 CVDdeath
tab death_new CVDdeath
tab pairs_total, mis
tab pairs_discordant
tab pairs_both_noncv
tab pairs_both_cv
tab n_cv
tab n_noncv
tab n_cv_raters
tab disagreement CVDdeath
logit disagreement age sex
logit disagreement age sex, or
logit disagreement age_death doc_complete sex i.death_location , or
tab doc_complete
logit disagreement age_death i.doc_complete sex i.death_location , or
logit disagreement age_death  sex i.death_location , or
logit disagreement age_death  sex i.doc_complete , or
logit CVDdeath age_death  sex i.doc_complete , or
tab CVDdeath
logit disagreement age_death i.doc_complete sex i.death_location CVDdeath , or
logit disagreement age_death i.doc_complete sex i.death_location i.CVDClass , or
logit disagreement age_death i.doc_complete sex i.death_location , or
logit disagreement age_death i.doc_complete sex i.death_loc6 , or
logit disagreement age_death  sex i.death_loc6 , or
testparm i.death_loc6
logit disagreement age_death i.doc_complete sex  , or
testparm i.doc_complete
lincom 2.doc_complete - 3.doc_complete, or
tabulate doc_complete, nolabel
logit disagreement c.age_death i.doc_complete i.sex, coeflegend
margins doc_complete, pwcompare(effects) mcompare(bonferroni)
margins doc_complete
generate double age_death10 = age_death/10
label variable age_death10 "Age at death, per 10 years"
testparm i.death_loc6
tab death_loc6
tab death_loc6, nolab
tab death_location, nolab
tab death_loc5
label copy death_location death_loc5
label define death_loc5 2 "ED/Transit/Inhospital" 3 "Home/Likely Home" 4 "Hospice" 5 "SNF" 6 "Out-of-hospital", replace
label variable death_loc5 "death_loc5"
label values death_loc5 death_loc5
tab death_loc5
testparm i.death_loc5
tab max_agree_binary3
tab unanimous_binary
tab majority_binary
tab n_ratings_case3
tab n_cat3
tab max_agree_binary
tab n_ratings_case
logit disagreement age_death10 sex if n_ratings_case==3
tab disagreement if n_ratings_case==3
logit disagreement age_death10 sex i.death_loc5 if n_ratings_case==3
logit disagreement age_death10 sex i.death_loc5 if n_ratings_case==3, or
logit disagreement age_death10 sex i.doc_complete if n_ratings_case==3, or
logit disagreement age_death10 sex i.CVDClass , or
tab death_new
tab death_new, nolab
tab death2cat
logit disagreement age_death10 sex i.death_loc5 , or
recode death2cat (3=1)(2=0)
logit death2cat age_death10 sex  , or
logit death2cat age_death10 sex i.death_loc5 , or
 testparm i.death_loc5
logit death2cat age_death10 sex i.doc_complete , or
 testparm i.doc_complete
ssc install sankey, replace
ssc install palettes, replace
ssc install colrspace, replace
ssc install graphfunctions, replace
ssc install schemepack, replace
set scheme white_tableau
help sankey
sankey n, from(Initial) to(Final)
sankey n, from(initial_class) to(final_class)
tab death_new
tab pairs_discordant
tab pairs_discordant cvdr3
tab pairs_discordant death_new
tab pairs_discordant n_ratings_case
tab pairs_discordant majority_binary3
tab pairs_discordant no_majority_exact
tab n_cv3 n_noncv3
tab cvdr1
tab cvdr2
tab cvdr1 cvdeath_old if cvdeath_old==1
tab cvdr2 cvdeath_old if cvdeath_old==1
tab cvdr1 cvdr2 if cvdeath_old==1
tab cvdr1 cvdr2 if cvdeath_old==1 & cvdr1==.
tab cvdr2 if cvdeath_old==1 & cvdr1==.
tab cvdr2 if cvdeath_old==1 & cvdr2==.
tab cvdr1 if cvdeath_old==1 & cvdr2==.
tab cvdr2 if cvdeath_old==1 & cvdr2==.
tab cvdr1 if cvdeath_old==1 & cvdr2==.
tab cvdr2 if cvdeath_old==1 & cvdr1==.
tab cvdr1 if cvdeath_old==1 & cvdr1==.
graph combine  adj_disagr_place_11_5_26.gph adj_possible_docs_11_5_26.gph adj_possible_docs_11_5_26.gph adj_disagr_prob_11_5_26.gph
graph combine  adj_disagr_place_11_5_26.gph adj_disagr_prob_11_5_26.gph adj_possible_docs_11_5_26.gph  adj_possible_docs_11_5_26.gph
graph combine  adj_disagr_place_11_5_26.gph adj_disagr_prob_11_5_26.gph adj_possible_place_11_5_26.gph  adj_possible_docs_11_5_26.gph	
	