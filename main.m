clear ;
clc;
%读取表格
tx=xlsread('tx.xlsx');
[px_tx,py_tx] = size(tx);
size_B=200;
size_A=200;
%种群大小
popsize=200;
%二进制编码长度
%根据变量数目更改C
chromlength=py_tx-4;
%交叉概率
pc = 2;
%变异概率
pm = 0.005;
%初始种群
pop = initpop(popsize,chromlength,py_tx);
%迭代数
for i = 1:10
    %计算适应度值（函数值）
    %利用p值的倒数作为适应度函数
    [fitvalue] = cal_objvalue(pop,px_tx,tx,size_A,size_B);
    %选择操作
    [fitvalue,newpop] = selection(pop,fitvalue);
    %最优解
    bestfit=fitvalue(1,1);
    x=pop(1,:);
    %交叉操作
    newpop = crossover(newpop,pc);
    %变异操作
    newpop = mutation(newpop,pm);
    %更新种群
    pop = newpop;
    i
    %保证返回figure是正确的
    fprintf('p为 %f\n',1/bestfit);
end
%对最优解画图
draw(pop,px_tx,tx);
%对最优个体与最优解进行输出
fprintf(' %d ',x);
fprintf('\n最小的p为 --->>%f\n',1/bestfit);