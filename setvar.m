function [TimeVar,EventVar,GroupVar,daxiao] = setvar(A)
[tx,ty]=size(A);
t1=1;
e1=1;
t2=1;
e2=1;
a1=1;
a2=1;
for i=1:tx
    if A(i,2)==0
        t1(a1,1)=A(i,1);
        e1(a1,1)=A(i,3);
        a1=a1+1;
    else
        t2(a2,1)=A(i,1);
        e2(a2,1)=A(i,3);
        a2=a2+1;
    end
end
TimeVar=[t1;t2];

EventVar = [e1;e2];
[tx1,ty1]=size(t1);
[tx2,ty2]=size(t2);
if tx1<tx2
    daxiao=tx1;
else daxiao=tx2;
end
g1=cell(size(t1));
g1(:) = {'Group 1'};

g2=cell(size(t2));
g2(:) = {'Group 2'};

GroupVar= [g1;g2];