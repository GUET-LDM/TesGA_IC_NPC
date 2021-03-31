clear
clc
% 删除上一次的计算结果
delete('result.xlsx');
% 输入数据库
tx=xlsread('119.xlsx');
% tx=xlsread('NPC_total_os(20.10.8) .xlsx');
train=xlsread('train300.xlsx');
% train(:,[1:4])=[];
p=xlsread('p.xlsx');
% p=load('totalp.mat');
pop=xlsread('pop.xlsx');
% pop=load('poptotal.mat');
% 准备数据大小
[px_tx,~] = size(tx);
[popx,popy]=size(pop);
% 进行you—non_you的计算
[a11,a22] = cal_objvalue(pop,px_tx,tx);
% 进行bootstrap验证
[pb,times,sum2] = Verify(pop,tx,train);
[pb_x,pb_y]=size(pb);
% 数组准备
sum=a11+a22;
sum1=zeros(popx,1);
result=zeros(popx,6);
% 特征数计算
for i1=1:popx
    for i2=1:popy
        sum1(i1,1)=pop(i1,i2)+sum1(i1,1);
    end
end
% 对输出结果整合
result(:,1)=p;
result(:,2)=times;
result(:,3)=sum;
result(:,4)=a22;
result(:,5)=a11;
result(:,6)=sum1;
% 输出
xlswrite('result.xlsx',result);