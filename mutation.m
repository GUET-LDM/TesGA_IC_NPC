%���ڱ���
%����˵��
%���������pop����������Ⱥ��pm���������
%���������newpop�����Ժ����Ⱥ
function [newpop] = mutation(pop,pm)
[px,py] = size(pop);
%���������ڶ���ĸ���
for i = 3:px
    for i1=1:py
        %����pmֵ��������λ
    if(rand<pm)
        if pop(i,i1)==1
            pop(i,i1)=0;
        else pop(i,i1)=1;
        end
    end
    end
end
%������Ⱥ
newpop=pop;
end