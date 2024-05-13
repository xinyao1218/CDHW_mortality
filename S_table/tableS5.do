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
* Table S5: AIC BIC
*
********************************************************************************

********************************************************************************
	
use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	stset obtime, id(id) failure(death==1) 
	global control trueage sex smoke drink exercise income BMI f41 f1 RH O3 PM25
	
********************************************************************************

	stcox frequency_spi_90_2 duration_spi_90_2 severity_spi_90_2 $control, r nolog 
	estat ic
	
	stcox frequency_spi_90_3 duration_spi_90_3 severity_spi_90_3 $control, r nolog 
	estat ic
	
	stcox frequency_spi_90_4 duration_spi_90_4 severity_spi_90_4 $control, r nolog 
	estat ic
	
	stcox frequency_spei_90_2 duration_spei_90_2 severity_spei_90_2 $control, r nolog 
	estat ic
	
	stcox frequency_spei_90_3 duration_spei_90_3 severity_spei_90_3 $control, r nolog 
	estat ic
	
	stcox frequency_spei_90_4 duration_spei_90_4 severity_spei_90_4 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_90_2 duration_twsa_90_2 severity_twsa_90_2 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_90_3 duration_twsa_90_3 severity_twsa_90_3 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_90_4 duration_twsa_90_4 severity_twsa_90_4 $control, r nolog 
	estat ic
	
********************************************************************************

	stcox frequency_spi_92_2 duration_spi_92_2 severity_spi_92_2 $control, r nolog 
	estat ic
	
	stcox frequency_spi_92_3 duration_spi_92_3 severity_spi_92_3 $control, r nolog 
	estat ic
	
	stcox frequency_spi_92_4 duration_spi_92_4 severity_spi_92_4 $control, r nolog 
	estat ic
	
	stcox frequency_spei_92_2 duration_spei_92_2 severity_spei_92_2 $control, r nolog 
	estat ic
	
	stcox frequency_spei_92_3 duration_spei_92_3 severity_spei_92_3 $control, r nolog 
	estat ic
	
	stcox frequency_spei_92_4 duration_spei_92_4 severity_spei_92_4 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_92_2 duration_twsa_92_2 severity_twsa_92_2 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_92_4 duration_twsa_92_4 severity_twsa_92_4 $control, r nolog 
	estat ic
	
********************************************************************************

	stcox frequency_spi_95_2 duration_spi_95_2 severity_spi_95_2 $control, r nolog 
	estat ic
	
	stcox frequency_spi_95_3 duration_spi_95_3 severity_spi_95_3 $control, r nolog 
	estat ic
	
	stcox frequency_spi_95_4 duration_spi_95_4 severity_spi_95_4 $control, r nolog 
	estat ic
	
	stcox frequency_spei_95_2 duration_spei_95_2 severity_spei_95_2 $control, r nolog 
	estat ic
	
	stcox frequency_spei_95_3 duration_spei_95_3 severity_spei_95_3 $control, r nolog 
	estat ic
	
	stcox frequency_spei_95_4 duration_spei_95_4 severity_spei_95_4 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_95_2 duration_twsa_95_2 severity_twsa_95_2 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_95_3 duration_twsa_95_3 severity_twsa_95_3 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_95_4 duration_twsa_95_4 severity_twsa_95_4 $control, r nolog 
	estat ic
	
********************************************************************************

	stcox frequency_spi_97_2 duration_spi_97_2 severity_spi_97_2 $control, r nolog 
	estat ic
	
	stcox frequency_spi_97_3 duration_spi_97_3 severity_spi_97_3 $control, r nolog 
	estat ic
	
	stcox frequency_spi_97_4 duration_spi_97_4 severity_spi_97_4 $control, r nolog 
	estat ic
	
	stcox frequency_spei_97_2 duration_spei_97_2 severity_spei_97_2 $control, r nolog 
	estat ic
	
	stcox frequency_spei_97_3 duration_spei_97_3 severity_spei_97_3 $control, r nolog 
	estat ic
	
	stcox frequency_spei_97_4 duration_spei_97_4 severity_spei_97_4 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_97_2 duration_twsa_97_2 severity_twsa_97_2 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_97_3 duration_twsa_97_3 severity_twsa_97_3 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_97_4 duration_twsa_97_4 severity_twsa_97_4 $control, r nolog 
	estat ic
	
********************************************************************************

	stcox frequency_spi_99_2 duration_spi_99_2 severity_spi_99_2 $control, r nolog 
	estat ic
	
	stcox frequency_spi_99_3 duration_spi_99_3 severity_spi_99_3 $control, r nolog 
	estat ic
	
	stcox frequency_spi_99_4 duration_spi_99_4 severity_spi_99_4 $control, r nolog 
	estat ic
	
	stcox frequency_spei_99_2 duration_spei_99_2 severity_spei_99_2 $control, r nolog 
	estat ic
	
	stcox frequency_spei_99_3 duration_spei_99_3 severity_spei_99_3 $control, r nolog 
	estat ic
	
	stcox frequency_spei_99_4 duration_spei_99_4 severity_spei_99_4 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_99_2 duration_twsa_99_2 severity_twsa_99_2 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_99_3 duration_twsa_99_3 severity_twsa_99_3 $control, r nolog 
	estat ic
	
	stcox frequency_twsa_99_4 duration_twsa_99_4 severity_twsa_99_4 $control, r nolog 
	estat ic
	
********************************************************************************