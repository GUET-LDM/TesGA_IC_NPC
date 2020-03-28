%初始化种群大小
%输入变量：
%popsize：种群大小
%chromlength：染色体长度-->>转化的二进制长度
%输出变量：
%pop：种群
function pop=initpop(popsize,chromlength,py_tx)
for i1=1:popsize
    amount=round(1+(py_tx-6).*rand);
    pop=zeros(popsize,chromlength);
    for i=1:amount
        m=round(1+chromlength.*rand) ;
        pop(i1,m)=1;
    end
end
end