clear ;
clc;
rand('seed',2019)
% ��ӿ��ظ�ʵ������������
delete('pop.xlsx');
delete('p.xlsx');
% ɾ��֮ǰ���򴴽���Excel
%��ȡ���
tx=xlsread('train300.xlsx');
% tx=xlsread('NPC_total_os(20.10.8) .xlsx');
[px_tx,py_tx] = size(tx);
% ��ȡtx���ݿ�Ĵ�С
% Ϊ�����������Ⱥ��׼��
size_B=150;
size_A=50;
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
for i = 1:100000
    %������Ӧ��ֵ������ֵ��
    [p,pop] = cal_objvalue(pop,px_tx,tx,size_A,size_B);
    %���ɱ���ֵ
    %   ��pС��0.05�ĸ��������б���
    [totalp,poptotal,n] = conserve(popsize,pop,p,n,totalp,poptotal);
    %ѡ�����
    %     ѡ�����Ÿ����Ŵ�����һ����pֵ����
    [p,newpop] = selection(pop,p);
    %���Ž�
    %     ������Сpֵ�����Ż���
    x=pop(1,:);
    %�������
    newpop = crossover(newpop,pc);
    %�������
    newpop = mutation(newpop,pm);
    %������Ⱥ
    pop = newpop;
    %     �����۲��������
    i
    fprintf('pΪ %f\n',p(1,1));
end
 [poptotal,totalp] = pop_p_overlat(poptotal,totalp);
% ���ڼ�¼�����Ļ������ȥ��
% ����Excel
xlswrite('p.xlsx',totalp);
xlswrite('pop.xlsx',poptotal);
%�����Ÿ��������Ž�������
fprintf(' %d ',x);
fprintf('\n��С��pΪ --->>%f\n',p(1,1)); 