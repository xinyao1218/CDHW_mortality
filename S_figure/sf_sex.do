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
* SF: sex
*
********************************************************************************

	*regression
use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3  PM25
	stset obtime, id(id) failure(death==1)  
	
	stcox c.frequency_twsa_92_3 c.duration_twsa_92_3##i.sex c.severity_twsa_92_3 $control, r nolog
	parmest , saving($figure/sf_sex/sf_sex_duration.dta, replace)

	stcox c.frequency_twsa_92_3 c.duration_twsa_92_3 c.severity_twsa_92_3##i.sex $control, r nolog 
	parmest , saving($figure/sf_sex/sf_sex_severity.dta, replace)

********************************************************************************	
	
	* sf sex-1
	

		cd $figure/sf_sex
		openall, storefilename(fn)
		keep if (parm=="0b.sex#c.duration_twsa_92_3" | parm=="1.sex#c.duration_twsa_92_3")
		gen hr=exp(estimate)
		gen lb=exp(min95)
		gen ub=exp(max95)
		drop estimate min95 max95 fn
		gen maker1 = hr
		format %4.3f maker1
		gen no=_n
		sort no 
		replace no=no-1
		gen x = no +0.5
		
		graph twoway   (rcap lb ub x if no==0, vertical lcolor(blue*1.2) lwidth(medthick))	///
						(rcap lb ub x if no==1, vertical lcolor(red*1.2) lwidth(medthick))	///
						(scatter hr x  if no==0, msymbol(O) mlcolor(blue*1) mfcolor(blue*0.6) msize(1.5) mlabel(maker1) mlabposition(3) mlabgap(*1.2) mlabsize(3)) ///
						(scatter hr x  if no==1, msymbol(O) mlcolor(red*1) mfcolor(red*0.6) msize(1.5) mlabel(maker1) mlabposition(3) mlabgap(*1.2) mlabsize(3)) ///
						,scheme(plotplainblind) ///
						legend(off) ///
						xsize(3) ysize(2.5) ///
						yline(1, lp(dash) lc(yellow*1.3) lwidth(thin)) ///
						xlab(0 " " 0.5 "Older man" 1.5 "Older woman" 2 " ",labcolor(black) axis(1) nogrid labsize(3.5)) ///
						xscale(range(0 2)) ///
						xtitle("") ///
						title("Duration of CDHW"" "" ", pos(12) size(3.2) color(black)) ///
						fxsize(160) fysize(130) ///
						xline(0.5, lp(shortdash) lc(gray*0.7) lwidth(thin)) ///
						xline(1.5, lp(shortdash) lc(gray*0.7) lwidth(thin)) ///
						ylabel(0.99 (0.01) 1.03, labsize(3.15) nogrid)  ///
						ytitle("Hazard ratio"" ",size(3.15) color(black)) 
						
		graph export "$figure/sf_sex/sf_sex_1.png", replace width(3000)

********************************************************************************
		
	* sf sex-2
	

		cd $figure/sf_sex
		openall, storefilename(fn)
		keep if (parm=="0b.sex#c.severity_twsa_92_3" | parm=="1.sex#c.severity_twsa_92_3")
		gen hr=exp(estimate)
		gen lb=exp(min95)
		gen ub=exp(max95)
		drop estimate min95 max95 fn
		gen maker1 = hr
		format %4.3f maker1
		gen no=_n
		sort no 
		replace no=no-1
		gen x = no +0.5
		
		graph twoway   (rcap lb ub x if no==0, vertical lcolor(blue*1.2) lwidth(medthick))	///
						(rcap lb ub x if no==1, vertical lcolor(red*1.2) lwidth(medthick))	///
						(scatter hr x  if no==0, msymbol(O) mlcolor(blue*1) mfcolor(blue*0.6) msize(1.5) mlabel(maker1) mlabposition(3) mlabgap(*1.2) mlabsize(3)) ///
						(scatter hr x  if no==1, msymbol(O) mlcolor(red*1) mfcolor(red*0.6) msize(1.5) mlabel(maker1) mlabposition(3) mlabgap(*1.2) mlabsize(3)) ///
						,scheme(plotplainblind) ///
						legend(off) ///
						xsize(3) ysize(2.5) ///
						yline(1, lp(dash) lc(yellow*1.3) lwidth(thin)) ///
						xlab(0 " " 0.5 "Older man" 1.5 "Older woman" 2 " ",labcolor(black) axis(1) nogrid labsize(3.5)) ///
						xscale(range(0 2)) ///
						xtitle("") ///
						title("Severity of CDHW"" "" ", pos(12) size(3.2) color(black)) ///
						fxsize(160) fysize(130) ///
						xline(0.5, lp(shortdash) lc(gray*0.7) lwidth(thin)) ///
						xline(1.5, lp(shortdash) lc(gray*0.7) lwidth(thin)) ///
						ylabel(0.985 (0.015) 1.045, labsize(3.15) nogrid)  ///
						ytitle("Hazard ratio"" ",size(3.15) color(black)) 
						
		graph export "$figure/sf_sex/sf_sex_2.png", replace width(3000)

********************************************************************************

	
	* sf sex-3

	use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3  PM25
	stset obtime, id(id) failure(death==1) 

	mkspline duration0 = duration_twsa_92_3 if sex==0, knots(4 7 13) cubic
	mkspline duration1 = duration_twsa_92_3 if sex==1, knots(4 7 13) cubic
	
	*regression
	stcox c.frequency_twsa_92_3 c.duration01 c.duration02 c.severity_twsa_92_3 $control if sex==0, r nolog 
	xblc duration01-duration02, covname(duration_twsa_92_3) at(0 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32) eform reference(0) generate(pa hr lb ub)
	rename pa pa0
	rename hr hr0
	rename lb lb0
	rename ub ub0
	
	stcox c.frequency_twsa_92_3 c.duration11 c.duration12 c.severity_twsa_92_3 $control if sex==1, r nolog 
	xblc duration11-duration12, covname(duration_twsa_92_3) at(0 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33) eform reference(0) generate(pa hr lb ub)
	rename pa pa1
	rename hr hr1
	rename lb lb1
	rename ub ub1
	

		* figure
		gen where=0.95
		gen pipe = "|"		
		graph twoway scatter where severity_twsa_92_3 if sex==0, plotr(m(b 4)) ms(none) mlabcolor(blue*0.6) mlabel(pipe) mlabsize(4) mlabpos(0)  ///
			||   scatter where severity_twsa_92_3 if sex==1, plotr(m(b 4)) ms(none) mlabcolor(red*0.6) mlabel(pipe) mlabsize(4) mlabpos(0)  ///
			||   line hr0 pa0,clpattern(solid) clwidth(0.4) clcolor(blue*1.3) ///
			||   line lb0 pa0,clpattern(dash) clwidth(0.3) clcolor(blue*1.3) ///
			||   line ub0 pa0,clpattern(dash) clwidth(0.3) clcolor(blue*1.3) ///
			||   line hr1 pa1,clpattern(solid) clwidth(0.4) clcolor(red*1.3) ///
			||   line lb1 pa1,clpattern(dash) clwidth(0.3) clcolor(red*1.3) ///
			||   line ub1 pa1,clpattern(dash) clwidth(0.3) clcolor(red*1.3) ///			
			||   ,    ///
				 xlabel(0 3 6 9 12 15 18 21 24 27 30 33, nogrid labsize(3.3))  ///
				 ylabel(1 1.1 1.2 1.3 1.4 1.5, nogrid labsize(3.3))  ///
				 yscale(range(0.95 1.55))  ///    
				 xscale(range(0 33))  ///
				 xtitle("Duration of CDHW (days)" , size(3.5))  ///
				 ytitle("Hazard ratio", size(3.5))  ///
				 title("") ///
				 ysize(6) xsize(14) ///
				 legend(order(3 6) label(3 "Older man") label(6 "Older woman") ring(0) pos(11) rowgap(0.5)) ///
				 fysize(120) fxsize(140) ///
				 scheme(plotplain) graphregion(fcolor(white) ilcolor(white) lcolor(white))

				 		graph export "$figure/sf_sex/sf_sex_3.png", replace width(3000)
						
						********************************************************************************

	
	* sf sex-4

	use "$data/main.dta", clear
	gen BMI=g101/((g1021/100)*(g1021/100))
	global control trueage i.sex i.smoke i.drink i.exercise income BMI i.f41 f1 RH O3  PM25
	stset obtime, id(id) failure(death==1) 

	mkspline severity0 = severity_twsa_92_3 if sex==0, knots(1 3 7) cubic
	mkspline severity1 = severity_twsa_92_3 if sex==1, knots(1 3 7) cubic
	
	*regression
	stcox c.frequency_twsa_92_3 c.duration_twsa_92_3 c.severity01 c.severity02 $control if sex==0, r nolog 
	xblc severity01-severity02, covname(severity_twsa_92_3) at(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 23 24 25 27 28 29 30 31 32 33 34 36 37 38 39 44) eform reference(0) generate(pa hr lb ub)
	rename pa pa0
	rename hr hr0
	rename lb lb0
	rename ub ub0
	
	stcox c.frequency_twsa_92_3 c.duration_twsa_92_3 c.severity11 c.severity12 $control if sex==1, r nolog 
	xblc severity11-severity12, covname(severity_twsa_92_3) at(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 28 29 30 31 32 33 34 35 37 44) eform reference(0) generate(pa hr lb ub)
	rename pa pa1
	rename hr hr1
	rename lb lb1
	rename ub ub1
	

		* figure
		gen where=0.65
		gen pipe = "|"		
		graph twoway scatter where severity_twsa_92_3 if sex==0, plotr(m(b 4)) ms(none) mlabcolor(blue*0.6) mlabel(pipe) mlabsize(4) mlabpos(0)  ///
			||   scatter where severity_twsa_92_3 if sex==1, plotr(m(b 4)) ms(none) mlabcolor(red*0.6) mlabel(pipe) mlabsize(4) mlabpos(0)  ///
			||   line hr0 pa0,clpattern(solid) clwidth(0.4) clcolor(blue*1.3) ///
			||   line lb0 pa0,clpattern(dash) clwidth(0.3) clcolor(blue*1.3) ///
			||   line ub0 pa0,clpattern(dash) clwidth(0.3) clcolor(blue*1.3) ///
			||   line hr1 pa1,clpattern(solid) clwidth(0.4) clcolor(red*1.3) ///
			||   line lb1 pa1,clpattern(dash) clwidth(0.3) clcolor(red*1.3) ///
			||   line ub1 pa1,clpattern(dash) clwidth(0.3) clcolor(red*1.3) ///			
			||   ,    ///
				 xlabel(0 4 8 12 16 20 24 28 32 36 40 44, nogrid labsize(3.3))  ///
				 ylabel(1 1.6 2.2 2.8 3.4 4.0, nogrid labsize(3.3))  ///
				 yscale(range(0.65 4.35))  ///    
				 xscale(range(0 44))  ///
				 legend(off)  /// 
				 xtitle("Severity of CDHW" , size(3.5))  ///
				 ytitle("Hazard ratio", size(3.5))  ///
				 title("") ///
				 ysize(6) xsize(14) ///
				 legend(order(3 6) label(3 "Older man") label(6 "Older woman") ring(0) pos(11) rowgap(0.5)) ///
				 fysize(120) fxsize(140) ///
				 scheme(plotplain) graphregion(fcolor(white) ilcolor(white) lcolor(white))

				 		graph export "$figure/sf_sex/sf_sex_4.png", replace width(3000)