clear;
clc;
delete('pop1.xlsx');
delete('p1.xlsx');
poptotal=xlsread('pop.xlsx');
totalp=xlsread('p.xlsx');
size_A=0;
size_B=0;
[px_pop,py_pop] = size(poptotal);
[px_p,py_p] = size(totalp);
n=1;
tx=xlsread('tx.xlsx');
[px_tx,py_tx] = size(tx);
newtotalp(1,1)=0;
newpoptotal=zeros(1,py_pop);
    [fitvalue,p,poptotal] = cal_objvalue(poptotal,px_tx,tx,size_A,size_B);
    [newtotalp,newpoptotal,n] = conserve(px_pop,poptotal,p,n,newtotalp,newpoptotal);

% Éú³ÉExcel
xlswrite('p1.xlsx',newtotalp);
xlswrite('pop1.xlsx',newpoptotal);