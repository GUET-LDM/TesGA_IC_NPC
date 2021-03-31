clc
clear
delete('vote_.xlsx');
delete('vote.xlsx');
pop=xlsread('pop.xlsx');
a=sum(pop);
for i=1:905
    ri(i,1)=sum(a.*pop(i,:));
end
xlswrite('vote.xlsx',a);
xlswrite('vote_.xlsx',ri);
