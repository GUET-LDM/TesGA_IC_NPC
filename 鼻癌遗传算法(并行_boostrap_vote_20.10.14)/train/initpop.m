%初始化种群大小
%输入变量：
%popsize：种群大小
%chromlength：二进制长度
%输出变量：
%pop：种群
function pop=initpop(popsize,chromlength)
% 建立pop的大小
pop=zeros(popsize,chromlength);
% 对每条基因的选择特征数进行随机
for i1=1:popsize
%     这里设置了生成1—7个特征
    amount=round(1+(6).*rand);
%     这里对特征的生成位置进行随机
    for i=1:amount
        m=round(1+(chromlength-1).*rand) ;
        pop(i1,m)=1;
    end
end
% 此时的pop已经是随机生成好的
end