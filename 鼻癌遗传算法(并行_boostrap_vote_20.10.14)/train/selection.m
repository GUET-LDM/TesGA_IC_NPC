%���ѡ���µĸ���
%���������pop��������Ⱥ��fitvalue����Ӧ��ֵ
%���������newpopѡ���Ժ�Ķ�������Ⱥ
function [p,newpop] = selection(pop,p)
%��������
[px,py] = size(p);
%ֻ������һ�ڶ����pֵ������
for i=1:px
    %ѡ��һ
    if p(1,1)>=p(i,1)
        p([1 i],:)=p([i 1],:);
        pop([1 i],:)=pop([i 1],:);
    end
end
for i=2:px
    %ѡ�ڶ�
    if p(2,1)>=p(i,1)
        p([2 i],:)=p([i 2],:);
        pop([2 i],:)=pop([i 2],:);
    end
end
%����pop��Ⱥ
newpop=pop;
end