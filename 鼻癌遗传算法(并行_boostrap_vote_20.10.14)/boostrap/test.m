clear
clc
% ɾ����һ�εļ�����
delete('result.xlsx');
% �������ݿ�
tx=xlsread('119.xlsx');
% tx=xlsread('NPC_total_os(20.10.8) .xlsx');
train=xlsread('train300.xlsx');
% train(:,[1:4])=[];
p=xlsread('p.xlsx');
% p=load('totalp.mat');
pop=xlsread('pop.xlsx');
% pop=load('poptotal.mat');
% ׼�����ݴ�С
[px_tx,~] = size(tx);
[popx,popy]=size(pop);
% ����you��non_you�ļ���
[a11,a22] = cal_objvalue(pop,px_tx,tx);
% ����bootstrap��֤
[pb,times,sum2] = Verify(pop,tx,train);
[pb_x,pb_y]=size(pb);
% ����׼��
sum=a11+a22;
sum1=zeros(popx,1);
result=zeros(popx,6);
% ����������
for i1=1:popx
    for i2=1:popy
        sum1(i1,1)=pop(i1,i2)+sum1(i1,1);
    end
end
% ������������
result(:,1)=p;
result(:,2)=times;
result(:,3)=sum;
result(:,4)=a22;
result(:,5)=a11;
result(:,6)=sum1;
% ���
xlswrite('result.xlsx',result);