clear;
clc;
% ɾ����һ�ε�����
delete('p1.xlsx');
%��ȡ���
poptotal=xlsread('pop.xlsx');
tx=xlsread('tx.xlsx');
% ��ȡtx���ݿ�Ĵ�С
[px_pop,py_pop] = size(poptotal);
% Ϊ�����������Ⱥ��׼��
[px_tx,py_tx] = size(tx);
[fitvalue] = cal_objvalue(poptotal,px_tx,tx);
% ����Excel
xlswrite('p1.xlsx',fitvalue);
