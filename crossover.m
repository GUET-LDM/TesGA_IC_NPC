%交叉变换
%输入变量：pop：二进制的父代种群数，pc：交叉的概率
%输出变量：newpop：交叉后的种群数
function [newpop] = crossover(pop,pc)
[px,py] = size(pop);
newpop = ones(size(pop));
%创立新数组
newpop(1,:) = pop(1,:);
newpop(2,:) = pop(2,:);
%保留第一大第二大的个体
for i = 3:px-1
    %从3开始随机交换
    if(rand<pc)
        %上一个个体与下一个个体交换
        cpoint = round(rand*py);
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
    else
        newpop(i,:) = pop(i,:);
        newpop(i+1,:) = pop(i+1,:);
    end
end
end