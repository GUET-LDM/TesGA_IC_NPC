%��ʼ����Ⱥ��С
%���������
%popsize����Ⱥ��С
%chromlength��Ⱦɫ�峤��-->>ת���Ķ����Ƴ���
%���������
%pop����Ⱥ
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