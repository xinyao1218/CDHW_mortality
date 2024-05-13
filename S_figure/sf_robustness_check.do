*==============================================================================* 
* Project:  Mortality CDHW older adults China           					   *
* Version:    									    				           *   
* Date:  				                                                       *
* Author: Xin Yao  					                                           *    
*==============================================================================*


* set directories 
clear all
set maxvar  30000
set more off



global dir "C:\Users\yaoxin\Desktop\Mortality_CDHW_olderadults_China"
global data "$dir/data"
global table "$dir/table"
global figure "$dir/figure"

********************************************************************************
*
* SF: Robustness CHeck
*
********************************************************************************

	
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25
	

	*regression 
	use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 
	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/sf_robustness_check/sf_reg.dta, replace)

		
	*Robustness_checks1
	use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	gen pro=floor(gbcode/10000)
	bys death:tab pro
	drop if pro==45
	stset obtime, id(id) failure(death==1) 
	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/sf_robustness_check/sf_rc1.dta, replace)
	
	
		
	*Robustness_checks2
	use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	bys death:tab year
	drop if year==2006
	stset obtime, id(id) failure(death==1) 	
	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/sf_robustness_check/sf_rc2.dta, replace)
	
		
	*Robustness_checks3
	use "$data/main.dta", clear
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 i.area RH O3 PM25
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/sf_robustness_check/sf_rc3.dta, replace)
	
	
		
	*Robustness_checks4
	use "$data/main.dta", clear
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 gbcode RH O3 PM25
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/sf_robustness_check/sf_rc4.dta, replace)
	
	
	*Robustness_checks5
	use "$data/main.dta", clear
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 gbcode i.area RH O3 PM25
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/sf_robustness_check/sf_rc5.dta, replace)
	
	*Robustness_checks6
	use "$data/main.dta", clear
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 i.hypertension i.diabetes i.heartdisease i.stroke_cvd i.asthma i.tuberculosis i.cataract i.glaucoma i.cancer i.gastric_ulcer i.parkinson i.bedsore i.arthritis i.dementia RH O3 PM25
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/sf_robustness_check/sf_rc6.dta, replace)
		
	*Robustness_checks7
	use "$data/main.dta", clear
	global control trueage i.sex 
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/sf_robustness_check/sf_rc7.dta, replace)
	
********************************************************************************

	* sf_robustness_check_1
		cd $figure/sf_robustness_check
		openall, storefilename(fn)
		keep if parm == "frequency_twsa_92_3" 	
		gen hr=exp(estimate)
		gen lb=exp(min95)
		gen ub=exp(max95)
		* group
		gen group=1
		replace group=2 if fn=="sf_rc1.dta"
		replace group=3 if fn=="sf_rc2.dta"
		replace group=4 if fn=="sf_rc3.dta"
		replace group=5 if fn=="sf_rc4.dta"
		replace group=6 if fn=="sf_rc5.dta"
		replace group=7 if fn=="sf_rc6.dta"
		replace group=8 if fn=="sf_rc7.dta"
		sort group
		keep parm hr lb ub group
		
		gen y = 9 - group
		
		label define ylabel			///
				8 "Baseline "				///
				7 "Model 3 "				///
				6 "Model 4 "				///
				5 "Model 5 " ///
				4 "Model 6 " ///
				3 "Model 7 " ///
				2 "Model 8 " ///
				1 "Model 9 " ///
			
			label values y ylabel
			
		graph twoway (rcap lb ub y if y == 8, horizontal lcolor(blue*1.2) lwidth(0.6)) ///
					 (rcap lb ub y if y < 8, horizontal lcolor(cranberry*1.2) lwidth(0.6)) ///
					 (scatter y hr if y == 8, msymbol(O) mlcolor(blue*1) mfcolor(blue*0.6) msize(1.5) ) ///
					 (scatter y hr if y < 8, msymbol(O) mlcolor(cranberry*1) mfcolor(cranberry*0.6) msize(1.5)) ///
				     , scheme(plotplain) 	///	
					 xline(1) ///
					 yline(1 2 3 4 5 6 7 8, lpattern(dot) lcolor(gs10) lwidth(vthin)) ///
				     legend(off) ///
					 ylabel(1 2 3 4 5 6 7 8, valuelabel nogrid labsize(3.5)) ///
				     yscale(range(0.5 8.5)) ///
					 ytitle("") xtitle("") ///
					 title(" ""a. Frequency of CHDW "" ", pos(11) size(4)) ///
					 xlabel(0.95 (.05) 1.10, nogrid labsize(3.5)) ///
					 xscale(range(0.95 1.10)) ///
					 fxsize(140) fysize(140) ///
					 xtitle(" " " Hazard ratio",size(3.6) color(black))
					  
		graph save "$figure/sf_robustness_check/sf_rc_1", replace

********************************************************************************

	* sf_robustness_check_2
		cd $figure/sf_robustness_check
		openall, storefilename(fn)
		keep if parm == "duration_twsa_92_3" 	
		gen hr=exp(estimate)
		gen lb=exp(min95)
		gen ub=exp(max95)
		* group
		gen group=1
		replace group=2 if fn=="sf_rc1.dta"
		replace group=3 if fn=="sf_rc2.dta"
		replace group=4 if fn=="sf_rc3.dta"
		replace group=5 if fn=="sf_rc4.dta"
		replace group=6 if fn=="sf_rc5.dta"
		replace group=7 if fn=="sf_rc6.dta"
		replace group=8 if fn=="sf_rc7.dta"
		sort group
		keep parm hr lb ub group
		
		gen y = 9 - group
		
		
		graph twoway (rcap lb ub y if y == 8, horizontal lcolor(blue*1.2) lwidth(0.6)) ///
					 (rcap lb ub y if y < 8, horizontal lcolor(cranberry*1.2) lwidth(0.6)) ///
					 (scatter y hr if y == 8, msymbol(O) mlcolor(blue*1) mfcolor(blue*0.6) msize(1.5) ) ///
					 (scatter y hr if y < 8, msymbol(O) mlcolor(cranberry*1) mfcolor(cranberry*0.6) msize(1.5)) ///
				     , scheme(plotplain) 	///	
					 xline(1) ///
					 yline(1 2 3 4 5 6 7 8, lpattern(dot) lcolor(gs10) lwidth(vthin)) ///
				     legend(off) ///
					 ylabel("", valuelabel) ///
				     yscale(range(0.5 8.5)) ///
					 ytitle("") xtitle("") ///
					 title(" ""b. Duration of CHDW "" ", pos(11) size(4)) ///
					 xlabel(0.99 (.01) 1.02, nogrid labsize(3.5)) ///
					 xscale(range(0.99 1.02)) ///
					 fxsize(120) fysize(140) ///
					 xtitle(" " " Hazard ratio",size(3.6) color(black))
					  
		graph save "$figure/sf_robustness_check/sf_rc_2", replace		
		
********************************************************************************

	* sf_robustness_check_2
		cd $figure/sf_robustness_check
		openall, storefilename(fn)
		keep if parm == "severity_twsa_92_3" 	
		gen hr=exp(estimate)
		gen lb=exp(min95)
		gen ub=exp(max95)
		* group
		gen group=1
		replace group=2 if fn=="sf_rc1.dta"
		replace group=3 if fn=="sf_rc2.dta"
		replace group=4 if fn=="sf_rc3.dta"
		replace group=5 if fn=="sf_rc4.dta"
		replace group=6 if fn=="sf_rc5.dta"
		replace group=7 if fn=="sf_rc6.dta"
		replace group=8 if fn=="sf_rc7.dta"
		sort group
		keep parm hr lb ub group
		
		gen y = 9 - group
		
		
		graph twoway (rcap lb ub y if y == 8, horizontal lcolor(blue*1.2) lwidth(0.6)) ///
					 (rcap lb ub y if y < 8, horizontal lcolor(cranberry*1.2) lwidth(0.6)) ///
					 (scatter y hr if y == 8, msymbol(O) mlcolor(blue*1) mfcolor(blue*0.6) msize(1.5) ) ///
					 (scatter y hr if y < 8, msymbol(O) mlcolor(cranberry*1) mfcolor(cranberry*0.6) msize(1.5)) ///
				     , scheme(plotplain) 	///	
					 xline(1) ///
					 yline(1 2 3 4 5 6 7 8, lpattern(dot) lcolor(gs10) lwidth(vthin)) ///
				     legend(off) ///
					 ylabel("", valuelabel) ///
				     yscale(range(0.5 8.5)) ///
					 ytitle("") xtitle("") ///
					 title(" ""c. Severity of CHDW "" ", pos(11) size(4)) ///
					 xlabel(0.985 (.015) 1.03, nogrid labsize(3.5)) ///
					 xscale(range(0.985 1.03)) ///
					 fxsize(120) fysize(140) ///
					 xtitle(" " " Hazard ratio",size(3.6) color(black))
					  
		graph save "$figure/sf_robustness_check/sf_rc_3", replace

********************************************************************************
	
		graph combine "$figure/sf_robustness_check/sf_rc_1" "$figure/sf_robustness_check/sf_rc_2" "$figure/sf_robustness_check/sf_rc_3", ///
				graphregion(fcolor(white) lcolor(white)) imargin(small) col(3) iscale(0.6) xsize(20) ysize(10)
		graph export "$figure/sf_robustness_check/sf_robustness_check.png", replace width(3000)
