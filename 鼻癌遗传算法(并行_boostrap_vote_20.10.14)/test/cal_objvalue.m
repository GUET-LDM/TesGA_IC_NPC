%计算函数目标值
%输入变量：两组病人的数据
%输出变量：p的倒数值
% 一行一行解决p值计算，取p的最小值
%生成可以计算p值的3*n数组
function [p] = cal_objvalue(pop,px_tx,tx)
clear C;
[px_pop,py_pop] = size(pop);
for i3=1:px_pop
    %对pop种群进行计算
    row_B=1;
    row_A=1;
    for i1=1:px_tx
        %对tx数组纵向循环统计
        for i2=1:py_pop
            %对特征循环
            if i2==1
                sum=0;
                equal=0;
            end
            sum=sum+pop(i3,i2);
            if pop(i3,i2)==1
                if tx(i1,i2+4)==0
                    %统计全零的个体数目
                    equal=equal+1;
                end
            end
        end
        if i2==py_pop
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
 [TimeVar_B,EventVar_B,GroupVar_B] = setvar(B);
%  [TimeVar_A,EventVar_A,GroupVar_A] = setvar(A);
            pb=Calculate_P(TimeVar_B,EventVar_B,GroupVar_B);
%             pa=Calculate_P(TimeVar_A,EventVar_A,GroupVar_A);
pa=1;
            if  pb>pa
                p(i3,1)=pa;
            else
                p(i3,1)=pb;
            end            
    clear A B ;
end
clearvars -except objvalue p a11 a22
end
