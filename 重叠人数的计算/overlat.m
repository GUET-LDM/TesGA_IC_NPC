%计算两个不同的选择策略之间的重叠人数。
% %将较优解的数组赋予D，并根据D画图
clear;
clc;
tx=xlsread('tx.xlsx');
[px_tx,py_tx] = size(tx);
equal_person=0;
x1=[1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	1	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
];
szx1= 1  ;  
%输入x1要画的数组1为A，2为B
  
x2=[0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
];
szx2= 2 ;
%输入x1要画的数组1为A，2为B
  
[px_x1,py_x1] = size(x1);
[px_x2,py_x2] = size(x2);
row_A1=1;
row_B1=1;
row_A2=1;
row_B2=1;
for i11=1:px_tx
    %对tx数组纵向循环统计
    for i21=1:py_x1
        %对特征循环
        if i21==1
            sum=0;
            equal=0;
        end
        sum=sum+x1(1,i21);
        if x1(1,i21)==1
            if tx(i11,i21+4)==0
                %统计全零的个体数目
                equal=equal+1;
            end
        end
    end
    if i21==py_x1
        %分别对AB数组赋值
        if equal==sum
            A1(row_A1,1)=tx(i11,2);
            A1(row_A1,2)=tx(i11,4);
            A1(row_A1,3)=tx(i11,3);
            Cx1_A(row_A1,1)=tx(i11,1);
            row_A1=row_A1+1;
        else
            
            B1(row_B1,1)=tx(i11,2);
            B1(row_B1,2)=tx(i11,4);
            B1(row_B1,3)=tx(i11,3);
            Cx1_B(row_B1,1)=tx(i11,1);
            row_B1=row_B1+1;
        end
    end
end
[TimeVar_B1,EventVar_B1,GroupVar_B1]= setvar(B1);
[TimeVar_A1,EventVar_A1,GroupVar_A1] = setvar(A1);
if szx1==1 
    [p]=MatSurv(TimeVar_A1,EventVar_A1, GroupVar_A1)
         [dxx1,q] = size(A1);
          Cx1= Cx1_A;
else[p]=MatSurv(TimeVar_B1,EventVar_B1, GroupVar_B1)
         [dxx1,q] = size(B1);
          Cx1= Cx1_B;
end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
for i12=1:px_tx
    %对tx数组纵向循环统计
    for i22=1:py_x2
        %对特征循环
        if i22==1
            sum=0;
            equal=0;
        end
        sum=sum+x2(1,i22);
        if x2(1,i22)==1
            if tx(i12,i22+4)==0
                %统计全零的个体数目
                equal=equal+1;
            end
        end
    end
    if i22==py_x2
        %分别对AB数组赋值
        if equal==sum
            A2(row_A2,1)=tx(i12,2);
            A2(row_A2,2)=tx(i12,4);
            A2(row_A2,3)=tx(i12,3);
            Cx2_A(row_B2,1)=tx(i12,1);
            row_A2=row_A2+1;
        else
            
            B2(row_B2,1)=tx(i12,2);
            B2(row_B2,2)=tx(i12,4);
            B2(row_B2,3)=tx(i12,3);
            Cx2_B(row_B2,1)=tx(i12,1);
            row_B2=row_B2+1;
        end
    end
end
[TimeVar_B2,EventVar_B2,GroupVar_B2]= setvar(B2);
[TimeVar_A2,EventVar_A2,GroupVar_A2] = setvar(A2);
if szx2==1
    [p]=MatSurv(TimeVar_A2,EventVar_A2, GroupVar_A2)
    [dxx2,py_x1] = size(A2);
    Cx2= Cx2_A;
else
    [p]=MatSurv(TimeVar_B2,EventVar_B2, GroupVar_B2)
     [dxx2,py_x1] = size(B2);
     Cx2= Cx2_B;
end
for i=1:dxx1-1
    for ii=1:dxx2-1
        if     Cx2(ii,1)==Cx1(i,1)
        equal_person=equal_person+1;
        end
    end     
end
equal_person