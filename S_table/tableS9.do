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



global dir "C:\Users\\yaoxin\Desktop\Mortality_CDHW_olderadults_China"
global data "$dir/data"
global table "$dir/table"
global figure "$dir/figure"

********************************************************************************
*
* Table S9: Robustness CHeck
*
********************************************************************************

********************************************************************************
	
	
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25

	*regression 
	use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 
	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	
	outreg2 using $table/TableS9/TableS9.xls, replace se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control) 
	
	
	
	*Robustness_checks1
	use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	gen pro=floor(gbcode/10000)
	bys death:tab pro
	drop if pro==45
	stset obtime, id(id) failure(death==1) 
	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	outreg2 using $table/TableS9/TableS9.xls, append se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control)
		
	
	*Robustness_checks2
	use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	bys death:tab year
	drop if year==2006
	stset obtime, id(id) failure(death==1) 	
	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	outreg2 using $table/TableS9/TableS9.xls, append se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control)
	
	
	*Robustness_checks3
	use "$data/main.dta", clear
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 i.area RH O3 PM25
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	outreg2 using $table/TableS9/TableS9.xls, append se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25)
	

	*Robustness_checks4
	use "$data/main.dta", clear
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 gbcode RH O3 PM25
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	outreg2 using $table/TableS9/TableS9.xls, append se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25)
	
	
	*Robustness_checks5
	use "$data/main.dta", clear
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 gbcode i.area RH O3 PM25
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	outreg2 using $table/TableS9/TableS9.xls, append se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25)
	
	
	*Robustness_checks6
	use "$data/main.dta", clear
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 i.hypertension i.diabetes i.heartdisease i.stroke_cvd i.asthma i.tuberculosis i.cataract i.glaucoma i.cancer i.gastric_ulcer i.parkinson i.bedsore i.arthritis i.dementia RH O3 PM25
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	outreg2 using $table/TableS9/TableS9.xls, append se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25)
	
	
	*Robustness_checks7
	use "$data/main.dta", clear
	global control trueage i.sex 
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 	
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	outreg2 using $table/TableS9/TableS9.xls, append se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 trueage i.sex)
