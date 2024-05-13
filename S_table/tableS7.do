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
* Table S7: Baseline
*
********************************************************************************

********************************************************************************
	
use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25

	stset obtime, id(id) failure(death==1) 
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	
	outreg2 using $table/TableS7/TableS7.xls, replace se bracket dec(5) eform keep(frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control) 
	

