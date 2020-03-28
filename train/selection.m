%如何选择新的个体
%输入变量：pop二进制种群，fitvalue：适应度值
%输出变量：newpop选择以后的二进制种群
function [fitvalue,newpop] = selection(pop,fitvalue)
%构造轮盘
[px,py] = size(fitvalue);
%只保留第一第二大的p值的数组
for i=1:px
    %选第一
    if fitvalue(1,1)<=fitvalue(i,1)
        fitvalue([1 i],:)=fitvalue([i 1],:);
        pop([1 i],:)=pop([i 1],:);
    end
end
for i=2:px
    %选第二
    if fitvalue(2,1)<=fitvalue(i,1)
        fitvalue([2 i],:)=fitvalue([i 2],:);
        pop([2 i],:)=pop([i 2],:);
    end
end
%更新pop种群
newpop=pop;
end