function [poptotal,totalp] = pop_p_overlat(poptotal,totalp)
[px_poptotal,py_poptotal] = size(poptotal);

A=[poptotal,totalp];
A=unique(A,'rows');
poptotal=A(:,1:py_poptotal);
totalp=A(:,py_poptotal+1);