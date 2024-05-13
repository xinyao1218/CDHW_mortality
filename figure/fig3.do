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
* Figure 3: 
*
********************************************************************************

********************************************************************************

	* figure 3-1
	
use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25

	stset obtime, id(id) failure(death==1)  

	*regression
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	parmest , saving($figure/fig3/fig3_baseline.dta, replace)



	* figure
		cd $figure/fig3
		openall, storefilename(fn)
		drop if parm == "0b.sex" | parm == "1b.smoke" | parm == "1b.drink" | parm == "1b.exercise" | parm == "1b.f41" 
		gen hr=exp(estimate)
		gen lb=exp(min95)
		gen ub=exp(max95)
		drop estimate min95 max95 fn
		
		* group
		gen group = 1 if parm == "frequency_twsa_92_3"
		replace group = 2 if parm == "duration_twsa_92_3"
		replace group = 3 if parm == "severity_twsa_92_3"
		replace group = 4 if parm == "RH"
		replace group = 5 if parm == "O3"
		replace group = 6 if parm == "PM25"
		replace group = 7 if parm == "trueage"
		replace group = 8 if parm == "income"
		replace group = 9 if parm == "BMI"
		replace group = 10 if parm == "f1"
		replace group = 12 if parm == "1.sex"
		replace group = 14 if parm == "2.smoke"
		replace group = 15 if parm == "3.smoke"
		replace group = 16 if parm == "4.smoke"
		replace group = 18 if parm == "2.drink"
		replace group = 19 if parm == "3.drink"
		replace group = 20 if parm == "4.drink"
		replace group = 22 if parm == "2.exercise"
		replace group = 23 if parm == "3.exercise"
		replace group = 24 if parm == "4.exercise"
		replace group = 26 if parm == "2.f41"
		replace group = 27 if parm == "3.f41"
		replace group = 28 if parm == "4.f41"		
		replace group = 29 if parm == "5.f41"
		
		sort group
		
		*adjust numerical scheme
		gen y = 30 - group		

		graph twoway (rcap lb ub y if y <= 26 & y>19, horizontal lcolor(blue*1.2) lwidth(0.4)) ///
					 (rcap lb ub y if y >= 27, horizontal lcolor(red*1.2) lwidth(0.4)) ///
					 (rcap lb ub y if y <= 19, horizontal lcolor(orange*1.2) lwidth(0.4)) ///
					 (scatter y hr if y <= 26 & y>19, msymbol(O) mlcolor(blue*1) mfcolor(blue*0.6) msize(1) ) ///
					 (scatter y hr if y >= 27, msymbol(O) mlcolor(red*1) mfcolor(red*0.6) msize(1)) ///
					 (scatter y hr if y <= 19, msymbol(O) mlcolor(orange*1) mfcolor(orange*0.6) msize(1)) ///
				, scheme(plotplain) 	///	
				xline(1, lp(dash) lc(gs10*1.2) lwidth(thin)) ///
				legend(off) ///
				xlabel(-0.5 (0.5) 4.5, nogrid labsize(3.3)) ///
				xscale(range(-0.5 4.5)) ///
				ylabel("", valuelabel) ///
				yscale(range(0.5 30.2)) ///
				xtitle("") ///
				ytitle("") ///
				yline(29.5, lp(solid) lc(gs10*0.8) lwidth(0.1)) ///
				ysize(18) xsize(14) ///
				fysize(180) fxsize(120) ///
				text(30.2 0 "{bf:Risk Factors}", place(c) size(3)) ///
				text(29 -0.8 "Frequency of CDHW", place(r) size(2.5)) ///
				text(28 -0.8 "Duration of CDHW", place(r) size(2.5)) ///
				text(27 -0.8 "Severity of CDHW", place(r) size(2.5)) ///
				text(26 -0.8 "Relative humidity", place(r) size(2.5)) ///
				text(25 -0.8 "Ozone concentrations", place(r) size(2.5)) ///
				text(24 -0.8 "PM2.5 concentrations", place(r) size(2.5)) ///
				text(23 -0.79 "Age", place(r) size(2.5)) ///
				text(22 -0.8 "Household income", place(r) size(2.5)) ///
				text(21 -0.79 "BMI", place(r) size(2.5)) ///
				text(20 -0.81 "Years of education", place(r) size(2.5)) ///
				text(19 -0.8 "Sex ({it:Man})", place(r) size(2.5)) ///
				text(18 -0.6 "Woman", place(r) size(2.5)) ///
				text(17 -0.8 "Smoking status ({it:Never})", place(r) size(2.5)) ///
				text(16 -0.6 "Currently smoking", place(r) size(2.5)) ///
				text(15 -0.6 "Previously smoked", place(r) size(2.5)) ///
				text(14 -0.6 "Always smoke", place(r) size(2.5))  ///
				text(13 -0.8 "Drinking status ({it:Never})", place(r) size(2.5)) ///
				text(12 -0.6 "Currently drinking", place(r) size(2.5)) ///
				text(11 -0.6 "Previously drank", place(r) size(2.5)) ///
				text(10 -0.6 "Always drink", place(r) size(2.5)) ///
				text(9 -0.8 "Exercising status ({it:Never})", place(r) size(2.5)) ///
				text(8 -0.6 "Currently exercising", place(r) size(2.5)) ///
				text(7 -0.6 "Previously exercised", place(r) size(2.5)) ///
				text(6 -0.6 "Always exercise", place(r) size(2.5)) ///
				text(5 -0.8 "Marital status ({it:Cohabitation})", place(r) size(2.5)) ///
				text(4 -0.6 "Separated", place(r) size(2.5)) ///
				text(3 -0.6 "Divorced", place(r) size(2.5)) ///
				text(2 -0.6 "Widowed", place(r) size(2.5)) ///
				text(1 -0.6 "Never married", place(r) size(2.5)) /// 
				text(30.2 3 "{bf:HR (95% CI)}", place(c) size(3)) /// 
				text(29 3 "1.054 (1.045, 1.063)", place(c) size(2.5)) ///
				text(28 3 "1.012 (1.010, 1.014)", place(c) size(2.5)) ///
				text(27 3 "1.013 (1.009, 1.017)", place(c) size(2.5)) ///
				text(26 3 "1.008 (1.006, 1.011)", place(c) size(2.5)) ///
				text(25 3 "0.998 (0.996, 1.000)", place(c) size(2.5)) ///
				text(24 3 "1.005 (1.003, 1.007)", place(c) size(2.5)) ///
				text(23 3 "1.048 (1.046, 1.050)", place(c) size(2.5)) ///
				text(22 3 "0.888 (0.883, 0.894)", place(c) size(2.5)) ///
				text(21 3 "1.009 (1.005, 1.012)", place(c) size(2.5)) ///
				text(20 3 "0.992 (0.986, 0.997)", place(c) size(2.5)) ///
				text(18 3 "1.155 (1.114, 1.197)", place(c) size(2.5)) ///
				text(16 3 "1.051 (0.945, 1.169)", place(c) size(2.5)) ///
				text(15 3 "1.059 (1.012, 1.108)", place(c) size(2.5)) ///
				text(14 3 "1.203 (1.156, 1.253)", place(c) size(2.5)) ///
				text(12 3 "1.006 (0.932, 1.085)", place(c) size(2.5)) ///
				text(11 3 "1.048 (1.006, 1.093)", place(c) size(2.5)) ///
				text(10 3 "1.193 (1.147, 1.242)", place(c) size(2.5)) ///
				text(8 3 "0.800 (0.762, 0.840)", place(c) size(2.5)) ///
				text(7 3 "1.293 (1.247, 1.340)", place(c) size(2.5)) ///
				text(6 3 "0.985 (0.947, 1.023)", place(c) size(2.5)) ///
				text(4 3 "1.292 (1.155, 1.446)", place(c) size(2.5)) ///
				text(3 3 "1.717 (1.381, 2.135)", place(c) size(2.5)) ///
				text(2 3 "1.360 (1.305, 1.418)", place(c) size(2.5)) ///
				text(1 3 "1.358 (1.174, 1.570)", place(c) size(2.5)) ///
				text(30.2 4.2 "{bf:P-value}", place(c) size(3)) /// 
				text(29 4.2 "<0.01", place(c) size(2.5)) ///
				text(28 4.2 "<0.01", place(c) size(2.5)) ///
				text(27 4.2 "<0.01", place(c) size(2.5)) ///
				text(26 4.2 "<0.01", place(c) size(2.5)) ///
				text(25 4.2 "0.132", place(c) size(2.5)) ///
				text(24 4.2 "<0.01", place(c) size(2.5)) ///
				text(23 4.2 "<0.01", place(c) size(2.5)) ///
				text(22 4.2 "<0.01", place(c) size(2.5)) ///
				text(21 4.2 "<0.01", place(c) size(2.5)) ///
				text(20 4.2 "<0.01", place(c) size(2.5)) ///
				text(18 4.2 "<0.01", place(c) size(2.5)) ///
				text(16 4.2 "0.357", place(c) size(2.5)) ///
				text(15 4.2 "0.013", place(c) size(2.5)) ///
				text(14 4.2 "<0.01", place(c) size(2.5)) ///
				text(12 4.2 "0.884", place(c) size(2.5)) ///
				text(11 4.2 "0.026", place(c) size(2.5)) ///
				text(10 4.2 "<0.01", place(c) size(2.5)) ///
				text(8 4.2 "<0.01", place(c) size(2.5)) ///
				text(7 4.2 "<0.01", place(c) size(2.5)) ///
				text(6 4.2 "0.429", place(c) size(2.5)) ///
				text(4 4.2 "<0.01", place(c) size(2.5)) ///
				text(3 4.2 "<0.01", place(c) size(2.5)) ///
				text(2 4.2 "<0.01", place(c) size(2.5)) ///
				text(1 4.2 "<0.01", place(c) size(2.5)) 
				

		
		 graph export "$figure/fig3/fig3_1.png", replace width(3000)
		 
********************************************************************************

	* figure 3-2
	
use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25

	stset obtime, id(id) failure(death==1) 
	mkspline frequency = frequency_twsa_92_3, knots(1 3 5) cubic
	
	*regression
	stcox frequency1 frequency2 duration_twsa_92_3 severity_twsa_92_3 $control, r nolog 
	levelsof frequency_twsa_92_3
	xblc frequency1-frequency2, covname(frequency_twsa_92_3) at(0 1 2 3 4 5 6 7 8 9 10 11) eform reference(0) generate(pa hr lb ub)


		* figure
		gen where=0.9
		gen pipe = "|"		
		graph twoway scatter where frequency_twsa_92_3 , plotr(m(b 4)) ms(none) mlabcolor(gs5) mlabel(pipe) mlabsize(4) mlabpos(0) legend(off)   ///
			||   line hr pa,clpattern(solid) clwidth(0.4) clcolor(black*1.3) ///
			||   line lb pa,clpattern(dash) clwidth(0.3) clcolor(black*1.3) ///
			||   line ub pa,clpattern(dash) clwidth(0.3) clcolor(black*1.3) ///
			||   ,    ///
				 xlabel(0 1 2 3 4 5 6 7 8 9 10 11, nogrid labsize(3.3))  ///
				 ylabel(1 1.2 1.4 1.6 1.8, nogrid labsize(3.3))  ///
				 yscale(range(0.9 1.9))  ///    
				 xscale(range(0 11))  ///
				 legend(off)  /// 
				 xtitle("Frequency of CDHW (times)" , size(3.5))  ///
				 ytitle("Hazard ratio", size(3.5))  ///
				 title("") ///
				 ysize(6) xsize(14) ///
				 fysize(120) fxsize(140) ///
				 scheme(plotplain) graphregion(fcolor(white) ilcolor(white) lcolor(white))

		 graph export "$figure/fig3/fig3_2.png", replace width(3000)
		 
********************************************************************************

	* figure 3-3
	
use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25

	stset obtime, id(id) failure(death==1) 
	mkspline duration = duration_twsa_92_3, knots(4 7 13) cubic
	
	*regression
	stcox frequency_twsa_92_3 duration1 duration2 severity_twsa_92_3 $control, r nolog 
	levelsof duration_twsa_92_3
	xblc duration1-duration2, covname(duration_twsa_92_3) at(0 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33) eform reference(0) generate(pa hr lb ub)


		* figure
		gen where=0.95
		gen pipe = "|"		
		graph twoway scatter where duration_twsa_92_3 if duration_twsa_92_3<=33, plotr(m(b 4)) ms(none) mlabcolor(gs5) mlabel(pipe) mlabsize(4) mlabpos(0) legend(off)   ///
			||   line hr pa,clpattern(solid) clwidth(0.4) clcolor(black*1.3) ///
			||   line lb pa,clpattern(dash) clwidth(0.3) clcolor(black*1.3) ///
			||   line ub pa,clpattern(dash) clwidth(0.3) clcolor(black*1.3) ///
			||   ,    ///
				 xlabel(0 3 6 9 12 15 18 21 24 27 30 33, nogrid labsize(3.3))  ///
				 ylabel(1 1.1 1.2 1.3 1.4, nogrid labsize(3.3))  ///
				 yscale(range(0.95 1.45))  ///    
				 xscale(range(0 33))  ///
				 legend(off)  /// 
				 xtitle("Duration of CDHW (days)" , size(3.5))  ///
				 ytitle("Hazard ratio", size(3.5))  ///
				 title("") ///
				 ysize(6) xsize(14) ///
				 fysize(120) fxsize(140) ///
				 scheme(plotplain) graphregion(fcolor(white) ilcolor(white) lcolor(white))

		 graph export "$figure/fig3/fig3_3.png", replace width(3000)
		 
********************************************************************************

	* figure 3-4
	
use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3 PM25

	stset obtime, id(id) failure(death==1) 
	mkspline severity = severity_twsa_92_3, knots(1 3 7) cubic
	
	*regression
	stcox frequency_twsa_92_3 duration_twsa_92_3 severity1 severity2 $control, r nolog 
	levelsof severity_twsa_92_3
	xblc severity1-severity2, covname(severity_twsa_92_3) at(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 44) eform reference(0) generate(pa hr lb ub)


		* figure
		gen where=0.65
		gen pipe = "|"		
		graph twoway scatter where severity_twsa_92_3 , plotr(m(b 4)) ms(none) mlabcolor(gs5) mlabel(pipe) mlabsize(4) mlabpos(0) legend(off)   ///
			||   line hr pa,clpattern(solid) clwidth(0.4) clcolor(black*1.3) ///
			||   line lb pa,clpattern(dash) clwidth(0.3) clcolor(black*1.3) ///
			||   line ub pa,clpattern(dash) clwidth(0.3) clcolor(black*1.3) ///
			||   ,    ///
				 xlabel(0 4 8 12 16 20 24 28 32 36 40 44, nogrid labsize(3.3))  ///
				 ylabel(1 1.7 2.4 3.1 3.8, nogrid labsize(3.3))  ///
				 yscale(range(0.65 4.15))  ///    
				 xscale(range(0 44))  ///
				 legend(off)  /// 
				 xtitle("Severity of CDHW" , size(3.5))  ///
				 ytitle("Hazard ratio", size(3.5))  ///
				 title("") ///
				 ysize(6) xsize(14) ///
				 fysize(120) fxsize(140) ///
				 scheme(plotplain) graphregion(fcolor(white) ilcolor(white) lcolor(white))

		 graph export "$figure/fig3/fig3_4.png", replace width(3000)