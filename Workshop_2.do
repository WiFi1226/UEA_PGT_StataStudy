cd "/Users/wangfan/VscodeProject/Stata/data/PGT_ECONOMETRIC_METHODS"
// save "Workshop_2.dta", replace emptyok
use Workshop_2.dta, clear
describe
regress Y X
graph twoway (scatter Y X) (lfit Y X)
scatter Y X, xlabel(0(100)500) ylabel(0(20)100) || lfit Y X, range(0 500) legend(off)

predict yhat, xb // xb是线性预测值
predict uhat, residuals // residuals是残差值
list Y X yhat uhat

lincom X, level(95)
margins, at(X = 225) // 求X的边际效应
margins, at(X = (0(100)500)) // 求X的边际效应
margins, dydx(X) // 求X的边际效应
marginsplot, recast(line) // 画边际效应图



