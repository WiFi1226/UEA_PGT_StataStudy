cd "/Users/wangfan/VscodeProject/Stata/data/PGT_ECONOMETRIC_METHODS"
use Workshop_1.dta, clear
describe
scatter income exp
graph twoway (scatter income exp) (lfit income exp)
regress
predict uhat, resid
list uhat