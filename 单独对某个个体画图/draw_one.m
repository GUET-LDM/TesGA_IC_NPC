% %�����Ž�����鸳��D��������D��ͼ
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
    %��tx��������ѭ��ͳ��
    for i2=1:py_x
        %������ѭ��
        if i2==1
            sum=0;
            equal=0;
        end
        sum=sum+x(1,i2);
        if x(1,i2)==1
            if tx(i1,i2+4)==0
                %ͳ��ȫ��ĸ�����Ŀ
                equal=equal+1;
            end
        end
    end
    if i2==py_x
        %�ֱ��AB���鸳ֵ
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


