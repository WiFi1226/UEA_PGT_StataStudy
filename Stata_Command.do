// DOS查询部分，不建议写入do文件
pwd
ls
cd

dir
mkdir
sysdir

erase

type

memory



// log部分
capture log close // 关闭之前log，记录新结果
log using name.log, replace | append // 记录log，使用新文件替换追加
log off // 暂时关闭log
log on // 暂时打开log
log close


// 设置部分 通过set命令更改设置
query memory // 系统参数
query output // 输出参数
query other // 其他参数



prifix: command varlist ( = / if / in ) using, options // ? weights = 是什么意思
// 空白 = _all 所有变量，_numeric 所有数值型变量，_character 所有字符型变量，_allnumeric 所有数值型变量，_allcharacter 所有字符型变量
// A B-C A和变量B到C
// ? 不确定A*代表A开头的变量




// 导入导出部分


use exp94.dta, clear// dta数据导入
use rank nation varlist_name using exp94.dta, clear // dta数据中的部分变量导入内存
use exp94.dta, clear in 1 / 10 // dta数据中的部分观测单位导入变量
use exp94.dta, clear if exp > 3 // dta数据中的部分观测单位导入变量

import delimited using exp94.csv, clear // 导入dta以外数据导入
export delimited using exp94.csv, replace // 导出dta以外数据

save "新空白文件.dta", emptyok // 保存空白数据
save exp94.dta, replace // 保存数据(若无之前的dta，replace可省略)

browse exp94.dta // 只读浏览
edit exp94.dta // 编辑浏览


drop _all


// 数据查看部分

list // 表格形式查看数据

// 数据描述部分
// 描述某一变量跟在指令之后，第一个逗号之前，若缺少变量名报错varlist required

describe // 变量数据结构粗略描述
codebook // 变量数据结构详细描述，加不加detail参数都一样，(float型中、方、四分，byte型频数)

summarize // 连续变量粗略描述性统计 (也分类型不同，float是total..., byte是number... ) detail
tabulate varlist // 分类变量集中描述性统计 (需要变量对象) summarize(varlist)第二对象



summarize, sep(0)// 连续变量集中描述性统计,sep(0)去掉千分位分隔符
codebook, sep(0)// 连续变量集中描述性统计,sep(0)去掉千分位分隔符


// ? 或为codebook, compact

tabulate // 分类变量集中描述性统计
// ? summarize(exp)参数的含义
sort // 排序(默认从小到大，in 1/10 正数一到十 逆数倒数十到最后 in -10/L)
list name in - 10 / L // 查看具体观测单位

// 变量管理

generate groupscore = totalscore // 运算赋值生成新变量(筛选直接 = a > b)
drop groupscore // 删除变量
keep if groupscore ~ = 1 // 筛选观测单位
recode groupscore (1 / 3 = 1) (4 / 6 = 2) (7 / 9 = 3) // 分组重编码
egen z_totalscore = std(totalscore) // 标准化生成新变量  
// ? egen groupscore = cut(totalscore), at(0 3 6 9) 这个是什么

// 标签管理

label variable totalscore "总分" // 变量标签
label define group 1 "低分" 2 "中分" 3 "高分" // 分组变量标签

// 回归分析部分

regress exp size // 线性回归

// 参数估计部分

correlate

// 假设检验部分

ttest exp, by(group) // ? 分组t检验




// ! 图像管理 (参数附注)
// grss 添加单独输出页面
scatter var1 var2






histogram exp // 连续变量直方图
kdensity exp // 连续变量核密度图
graph bar exp // ? 连续变量柱状图 (mean)值的命令
graph hbox exp // 连续变量水平箱线图
graph combine graph1.gph graph2.gph, cols(1) // 图像合并

scatter Y X, xlabel(0(100)500) ylabel(0(20)100) || lfit Y X // ? scatter参数 和 graph twoway的不同
scatter exp size, msize(0.4) || qfit exp size, legend(off) saving(graph1, replace) // 连续变量散点图

graph twoway (scatter exp income) (lfit exp income) // 连续变量回归曲线图

// ? qfit为什么不能用


// ? prefix 用法，为什么by adults不能用