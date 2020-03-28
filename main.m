clear ;
clc;
%��ȡ���
tx=xlsread('tx.xlsx');
[px_tx,py_tx] = size(tx);
size_B=200;
size_A=200;
%��Ⱥ��С
popsize=200;
%�����Ʊ��볤��
%���ݱ�����Ŀ����C
chromlength=py_tx-4;
%�������
pc = 2;
%�������
pm = 0.005;
%��ʼ��Ⱥ
pop = initpop(popsize,chromlength,py_tx);
%������
for i = 1:10
    %������Ӧ��ֵ������ֵ��
    %����pֵ�ĵ�����Ϊ��Ӧ�Ⱥ���
    [fitvalue] = cal_objvalue(pop,px_tx,tx,size_A,size_B);
    %ѡ�����
    [fitvalue,newpop] = selection(pop,fitvalue);
    %���Ž�
    bestfit=fitvalue(1,1);
    x=pop(1,:);
    %�������
    newpop = crossover(newpop,pc);
    %�������
    newpop = mutation(newpop,pm);
    %������Ⱥ
    pop = newpop;
    i
    %��֤����figure����ȷ��
    fprintf('pΪ %f\n',1/bestfit);
end
%�����Ž⻭ͼ
draw(pop,px_tx,tx);
%�����Ÿ��������Ž�������
fprintf(' %d ',x);
fprintf('\n��С��pΪ --->>%f\n',1/bestfit);