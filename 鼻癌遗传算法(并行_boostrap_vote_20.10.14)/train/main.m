clear ;
clc;
rand('seed',2019)
% 添加可重复实验的种子随机数
delete('pop.xlsx');
delete('p.xlsx');
% 删除之前程序创建的Excel
%读取表格
tx=xlsread('train300.xlsx');
% tx=xlsread('NPC_total_os(20.10.8) .xlsx');
[px_tx,py_tx] = size(tx);
% 读取tx数据库的大小
% 为创建后面的种群做准备
size_B=150;
size_A=50;
% 设置想要跑出来的模型的最小人数
%种群大小
popsize=200;
%二进制编码长度
%根据变量数目更改
chromlength=py_tx-4;
%交叉概率
% 此程序意在更多的搜索，所以交叉概率设为2
pc = 2;
%变异概率
pm = 1;
%初始种群
pop = initpop(popsize,chromlength);
% 创建totalp
totalp(1,1)=0;
% 创建poptotal
poptotal=zeros(1,chromlength);
% n为计数器
n=1;
% 迭代循环
% i为迭代次数
for i = 1:100000
    %计算适应度值（函数值）
    [p,pop] = cal_objvalue(pop,px_tx,tx,size_A,size_B);
    %生成保存值
    %   对p小于0.05的个体基因进行保留
    [totalp,poptotal,n] = conserve(popsize,pop,p,n,totalp,poptotal);
    %选择操作
    %     选择最优个体遗传到下一代（p值排序）
    [p,newpop] = selection(pop,p);
    %最优解
    %     包括最小p值与最优基因
    x=pop(1,:);
    %交叉操作
    newpop = crossover(newpop,pc);
    %变异操作
    newpop = mutation(newpop,pm);
    %更新种群
    pop = newpop;
    %     计数观察迭代进程
    i
    fprintf('p为 %f\n',p(1,1));
end
 [poptotal,totalp] = pop_p_overlat(poptotal,totalp);
% 对于记录下来的基因进行去重
% 生成Excel
xlswrite('p.xlsx',totalp);
xlswrite('pop.xlsx',poptotal);
%对最优个体与最优解进行输出
fprintf(' %d ',x);
fprintf('\n最小的p为 --->>%f\n',p(1,1)); 