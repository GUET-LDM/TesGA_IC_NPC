%关于变异
%函数说明
%输入变量：pop：二进制种群，pm：变异概率
%输出变量：newpop变异以后的种群
function [newpop] = mutation(pop,pm)
[px,py] = size(pop);
%保留最大与第二大的个体
for i = 3:px
    if(rand<pm)
%   对任意一位进行变异      
        if pop(i,1+round((py-1).*rand))==0
            pop(i,1+round((py-1).*rand))=1;
        end
        if pop(i,1+round((py-1).*rand))==1
            pop(i,1+round((py-1).*rand))=0;
        end
    end
end
%更新种群
newpop=pop;
end