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
for i = 3:px-1
    %��3��ʼ�������
    if(rand<pc)
        %��һ����������һ�����彻��
        cpoint = round(rand*py);
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
    else
        newpop(i,:) = pop(i,:);
        newpop(i+1,:) = pop(i+1,:);
    end
end
end