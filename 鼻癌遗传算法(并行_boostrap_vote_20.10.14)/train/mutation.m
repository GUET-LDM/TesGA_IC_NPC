%���ڱ���
%����˵��
%���������pop����������Ⱥ��pm���������
%���������newpop�����Ժ����Ⱥ
function [newpop] = mutation(pop,pm)
[px,py] = size(pop);
%���������ڶ���ĸ���
for i = 3:px
    if(rand<pm)
%   ������һλ���б���      
        if pop(i,1+round((py-1).*rand))==0
            pop(i,1+round((py-1).*rand))=1;
        end
        if pop(i,1+round((py-1).*rand))==1
            pop(i,1+round((py-1).*rand))=0;
        end
    end
end
%������Ⱥ
newpop=pop;
end