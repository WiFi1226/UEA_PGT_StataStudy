cd "/Users/wangfan/VscodeProject/Stata/data/PGT_ECONOMETRIC_METHODS"
use Workshop_1.dta, clear
cls
// ! gr save a, replace
gr drop _all
list in 100 / 100
summarize income exp adults kids, detail
tab adults kids
histogram exp, freq bin(50)
tabulate adults kids, summ(exp)

gen d = exp < income
tab d
grss scatter income exp, msize(0.4) xlabel(0(10)60) ysize(expenditure) // ! xsize和xlabel不同！
grss scatter income exp, msize(0.4) xlabel(0(10)60) ysize(expenditure) || lfit income exp, range(0 60) legend(off)

gen size = adults + kids
grss scatter exp size, msize(0.4)
grss scatter exp size, msize(0.4) || qfit exp size

gen ephm = exp / size
label variable ephm "expenditure per household member"
grss scatter ephm size
grss scatter ephm size || qfit ephm size

grss scatter exp size, msize(0.4) || qfit exp size, legend(off) saving(graph1, replace)
grss scatter ephm size, msize(0.4) || qfit ephm size, legend(off) saving(graph2, replace) 
grss graph combine graph1.gph graph2.gph, cols(1)