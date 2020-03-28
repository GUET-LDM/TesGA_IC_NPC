clear ;
clc;
rand('seed',2019)
% ��ӿ��ظ�ʵ������������
delete('pop.xlsx');
delete('p.xlsx');
% ɾ��֮ǰ���򴴽���Excel
%��ȡ���
tx=xlsread('tx.xlsx');
[px_tx,py_tx] = size(tx);
% ��ȡtx���ݿ�Ĵ�С
% Ϊ�����������Ⱥ��׼��
size_B=5;
size_A=5;
% ������Ҫ�ܳ�����ģ�͵���С����
%��Ⱥ��С
popsize=200;
%�����Ʊ��볤��
%���ݱ�����Ŀ����
chromlength=py_tx-4;
%�������
% �˳������ڸ�������������Խ��������Ϊ2
pc = 2;
%�������
pm = 1;
%��ʼ��Ⱥ
pop = initpop(popsize,chromlength);
% ����totalp
totalp(1,1)=0;
% ����poptotal
poptotal=zeros(1,chromlength);
% nΪ������
n=1;
% ����ѭ��
% iΪ��������
for i = 1:1
    %������Ӧ��ֵ������ֵ��
    %����pֵ�ĵ�����Ϊ��Ӧ�Ⱥ���
    [fitvalue,p,pop] = cal_objvalue(pop,px_tx,tx,size_A,size_B);
    %���ɱ���ֵ
    %   ��pС��0.05�ĸ��������б���
    [totalp,poptotal,n] = conserve(popsize,pop,p,n,totalp,poptotal);
    %ѡ�����
    %     ѡ�����Ÿ����Ŵ�����һ����pֵ����
    [fitvalue,newpop] = selection(pop,fitvalue);
    %���Ž�
    %     ������Сpֵ�����Ż���
    bestfit=fitvalue(1,1);
    x=pop(1,:);
    %�������
    newpop = crossover(newpop,pc);
    %�������
    newpop = mutation(newpop,pm);
    %������Ⱥ
    pop = newpop;
end
% ����Excel
xlswrite('p.xlsx',totalp);
xlswrite('pop.xlsx',poptotal);
%�����Ÿ��������Ž�������
fprintf(' %d ',x);
fprintf('\n��С��pΪ --->>%f\n',1/bestfit);