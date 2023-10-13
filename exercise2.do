clear

use fes.dta
dis normal(2.37) - normal( - 1.14)
dis 2 + 2
summarize
/*
~ list exp in 1:100
? sdjaldsaj
! asdkalkds
*/

summarize adults if adults == 1
summarize exp if adults == 1 & kids == 3
codebook kids
codebook exp
histogram exp
summarize exp if adults == 1 & kids == 3 //(describe不能用于if条件)
list exp in 1 / 100
