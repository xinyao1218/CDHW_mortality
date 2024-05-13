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
* Table S8: Tests of proportional-hazards assumption after stcox
*
********************************************************************************

********************************************************************************
	
use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))

	
	global control trueage sex smoke drink exercise income BMI f41 f1 RH O3 PM25

	stset obtime, id(id) failure(death==1) 
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	
	estat phtest,d
	

