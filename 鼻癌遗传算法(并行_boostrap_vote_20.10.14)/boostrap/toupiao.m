clc
clear
pop=xlsread('pop.xlsx');
a=sum(pop);
xlswrite('vote.xlsx',a);