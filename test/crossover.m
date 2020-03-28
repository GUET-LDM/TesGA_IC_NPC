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
for i = 3:px
    %从3开始随机交换
    if(rand<pc)
        n=round((px-2)*rand)+2 ;
        while n==i
            n=round((px-2)*rand)+2 ;
        end
        %一个个体与任意一个个体交换
        cpoint = round((1+(rand-1))*py);
        newpop(i,:) = [pop(i,1:cpoint),pop(n,cpoint+1:py)];
        newpop(n,:) = [pop(n,1:cpoint),pop(i,cpoint+1:py)];
        
    end
end
end