% y=randperm(33);%1到33的一个序列
% red=zeros(1,6);
% for j=1:6%循环不放回抽走6个数
% index=randi(34-j,1);
% red(j)=y(index);
% % y(index)=[];%去掉bai抽du走的数，接着抽样
% end
    for j=1:181%循环不放回抽走6个数
    index=randi(301-j,1);
    px(j,:)=tx(index,:);
    tx(index,:)=[];%去掉bai抽du走的数，接着抽样
    end