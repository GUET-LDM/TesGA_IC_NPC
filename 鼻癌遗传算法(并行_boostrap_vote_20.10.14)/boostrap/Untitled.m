% y=randperm(33);%1��33��һ������
% red=zeros(1,6);
% for j=1:6%ѭ�����Żس���6����
% index=randi(34-j,1);
% red(j)=y(index);
% % y(index)=[];%ȥ��bai��du�ߵ��������ų���
% end
    for j=1:181%ѭ�����Żس���6����
    index=randi(301-j,1);
    px(j,:)=tx(index,:);
    tx(index,:)=[];%ȥ��bai��du�ߵ��������ų���
    end