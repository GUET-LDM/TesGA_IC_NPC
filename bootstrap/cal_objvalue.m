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
            else                
                B(row_B,1)=tx(i1,2);
                B(row_B,2)=tx(i1,4);
                B(row_B,3)=tx(i1,3);
                row_B=row_B+1;
            end
        end
    end 
 [TimeVar_B,EventVar_B,GroupVar_B,a1,a2] = setvar(B);
            p(i3,1)=Calculate_P(TimeVar_B,EventVar_B,GroupVar_B);
            a11(i3,1)=a1-1;
            a22(i3,1)=a2-1;
    clear A B ;
end
clearvars -except objvalue p a11 a22
end