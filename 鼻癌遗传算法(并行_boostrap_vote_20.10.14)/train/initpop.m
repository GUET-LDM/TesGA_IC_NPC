%��ʼ����Ⱥ��С
%���������
%popsize����Ⱥ��С
%chromlength�������Ƴ���
%���������
%pop����Ⱥ
function pop=initpop(popsize,chromlength)
% ����pop�Ĵ�С
pop=zeros(popsize,chromlength);
% ��ÿ�������ѡ���������������
for i1=1:popsize
%     ��������������1��7������
    amount=round(1+(6).*rand);
%     ���������������λ�ý������
    for i=1:amount
        m=round(1+(chromlength-1).*rand) ;
        pop(i1,m)=1;
    end
end
% ��ʱ��pop�Ѿ���������ɺõ�
end