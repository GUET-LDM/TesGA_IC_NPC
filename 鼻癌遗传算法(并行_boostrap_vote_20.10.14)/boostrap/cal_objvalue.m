%���㺯��Ŀ��ֵ
%������������鲡�˵�����
%���������p�ĵ���ֵ
% һ��һ�н��pֵ���㣬ȡp����Сֵ
%���ɿ��Լ���pֵ��3*n����
function [a11,a22] = cal_objvalue(pop,px_tx,tx)
clear C;
[px_pop,py_pop] = size(pop);
for i3=1:px_pop
    %��pop��Ⱥ���м���
    row_B=1;
    row_A=1;
    for i1=1:px_tx
        %��tx��������ѭ��ͳ��
        for i2=1:py_pop
            %������ѭ��
            if i2==1
                sum=0;
                equal=0;
            end
            sum=sum+pop(i3,i2);
            if pop(i3,i2)==1
                if tx(i1,i2+4)==0
                    %ͳ��ȫ��ĸ�����Ŀ
                    equal=equal+1;
                end
            end
        end
        if i2==py_pop
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
    if row_A>1
 [TimeVar_B,EventVar_B,GroupVar_B,ab1,ab2] = setvar(B);
 [TimeVar_A,EventVar_A,GroupVar_A,aa1,aa2] = setvar(A);
            pb=Calculate_P(TimeVar_B,EventVar_B,GroupVar_B);
            pa=Calculate_P(TimeVar_A,EventVar_A,GroupVar_A);
            if  pb>pa
                p(i3,1)=pa;
                a1=aa1;
                a2=aa2;
            else
                p(i3,1)=pb;
                a1=ab1;
                a2=ab2;
            end            
            a11(i3,1)=a1-1;
            a22(i3,1)=a2-1;
    end
    clear A B ;
end
clearvars -except objvalue p a11 a22
end
