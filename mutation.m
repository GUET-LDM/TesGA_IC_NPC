%关于变异
%函数说明
%输入变量：pop：二进制种群，pm：变异概率
%输出变量：newpop变异以后的种群
function [newpop] = mutation(pop,pm)
[px,py] = size(pop);
%保留最大与第二大的个体
for i = 3:px
    for i1=1:py
        %根据pm值变异其他位
    if(rand<pm)
        if pop(i,i1)==1
            pop(i,i1)=0;
        else pop(i,i1)=1;
        end
    end
    end
end
%更新种群
newpop=pop;
end