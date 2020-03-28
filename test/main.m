clear;
clc;
% 删除上一次的数据
delete('p1.xlsx');
%读取表格
poptotal=xlsread('pop.xlsx');
tx=xlsread('tx.xlsx');
% 读取tx数据库的大小
[px_pop,py_pop] = size(poptotal);
% 为创建后面的种群做准备
[px_tx,py_tx] = size(tx);
[fitvalue] = cal_objvalue(poptotal,px_tx,tx);
% 生成Excel
xlswrite('p1.xlsx',fitvalue);
