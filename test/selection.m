%���ѡ���µĸ���
%���������pop��������Ⱥ��fitvalue����Ӧ��ֵ
%���������newpopѡ���Ժ�Ķ�������Ⱥ
function [fitvalue,newpop] = selection(pop,fitvalue)
%��������
[px,py] = size(fitvalue);
%ֻ������һ�ڶ����pֵ������
for i=1:px
    %ѡ��һ
    if fitvalue(1,1)<=fitvalue(i,1)
        fitvalue([1 i],:)=fitvalue([i 1],:);
        pop([1 i],:)=pop([i 1],:);
    end
end
for i=2:px
    %ѡ�ڶ�
    if fitvalue(2,1)<=fitvalue(i,1)
        fitvalue([2 i],:)=fitvalue([i 2],:);
        pop([2 i],:)=pop([i 2],:);
    end
end
%����pop��Ⱥ
newpop=pop;
end