cd "/Users/wangfan/VscodeProject/Stata/data/PGT_ECONOMETRIC_METHODS"
use "Workshop3.dta", clear
scatter Y X
regress Y X
margins, at( X = 8 )
predict uhat, resid
predict yhat, xb
generate str var6 = "a" in 1
gen X2 = X ^ 2
regress Y X X2
scatter Y X, ylabel(0(100)1000) || lfit Y X, legend(off)
scatter Y X, ylabel(0(100)1000) || qfit Y X , legend(off)