%����任
%���������pop�������Ƶĸ�����Ⱥ����pc������ĸ���
%���������newpop����������Ⱥ��
function [newpop] = crossover(pop,pc)
[px,py] = size(pop);
newpop = ones(size(pop));
%����������
newpop(1,:) = pop(1,:);
newpop(2,:) = pop(2,:);
%������һ��ڶ���ĸ���
for i = 3:px
    %��3��ʼ�������
    if(rand<pc)
        n=round((px-2)*rand)+2 ;
        while n==i
            n=round((px-2)*rand)+2 ;
        end
        %һ������������һ�����彻��
        cpoint = round((1+(rand-1))*py);
        newpop(i,:) = [pop(i,1:cpoint),pop(n,cpoint+1:py)];
        newpop(n,:) = [pop(n,1:cpoint),pop(i,cpoint+1:py)];
        
    end
end
end