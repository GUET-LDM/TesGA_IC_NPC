% %将较优解的数组赋予D，并根据D画图
clear;
clc;
tx=xlsread('tx.xlsx');
[px_tx,py_tx] = size(tx);
 x=[1	1	1	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
];

[px_x,py_x] = size(x);
row_A=1;
row_B=1;
for i1=1:px_tx
    %对tx数组纵向循环统计
    for i2=1:py_x
        %对特征循环
        if i2==1
            sum=0;
            equal=0;
        end
        sum=sum+x(1,i2);
        if x(1,i2)==1
            if tx(i1,i2+4)==0
                %统计全零的个体数目
                equal=equal+1;
            end
        end
    end
    if i2==py_x
        %分别对AB数组赋值
        if equal==sum
            A(row_A,1)=tx(i1,2);
            A(row_A,2)=tx(i1,4);
            A(row_A,3)=tx(i1,3);
            row_A=row_A+1;
        else
            
            B(row_B,1)=tx(i1,2);
            B(row_B,2)=tx(i1,4);
            B(row_B,3)=tx(i1,3);
            row_B=row_B+1;
        end
    end
end
    [TimeVar_B,EventVar_B,GroupVar_B]= setvar(B);
    [TimeVar_A,EventVar_A,GroupVar_A] = setvar(A);
    [p]=MatSurv(TimeVar_A,EventVar_A, GroupVar_A)
    [p]=MatSurv(TimeVar_B,EventVar_B, GroupVar_B)


