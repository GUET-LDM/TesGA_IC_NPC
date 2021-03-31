%计算函数目标值
%输入变量：两组病人的数据
%输出变量：p的倒数值
% 一行一行解决p值计算，取p的最小值
%生成可以计算p值的3*n数组
function [p,pop] = cal_objvalue(pop,px_tx,tx,size_A,size_B)
clear C;
[px_pop,py_pop] = size(pop);
p=zeros(200,1);
parfor i3=1:px_pop
[p(i3,1)] = logranktest(pop,px_tx,tx,py_pop,size_A,size_B,i3)
end
% 将p的倒数进行输出（进入main）
% 清除其他变量
sumpop=sum(pop,2);
for i4=1:px_pop
    if sumpop(i4,1)>15
        pop(i4,:)=0;
        %          这里回调为三个
        amount=round(1+(2).*rand);
        for i=1:amount
            %                 这里随机的是回调后重新生成的特征的位置
            m=round(1+(py_pop-1).*rand) ;
            pop(i4,m)=1;
        end
    end
end
clearvars -except p pop
end
function [p] = logranktest(pop,px_tx,tx,py_pop,size_A,size_B,i3)
yanzheng=0;
    %对pop种群进行计算
    row_A=1;
    row_B=1;
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
    %     对变量个数进行回调防止早熟
%     if sum>15
%         pop(i3,:)=0;
%         %          这里回调为三个
%         amount=round(1+(2).*rand);
%         for i=1:amount
%             %                 这里随机的是回调后重新生成的特征的位置
%             m=round(1+(py_pop-1).*rand) ;
%             pop(i3,m)=1;
%         end
%     end
    %      控制不符合条件的基因不会被输出
    if row_B<size_B
        %确定A，B数组值域
        yanzheng=1;
        %         建立p值计算所需要的数组
    else
        if row_B==1
            yanzheng=1;
        else
            [TimeVar_B,EventVar_B,GroupVar_B] = setvar(B);
        end
    end
    if row_A<size_A
        %确定A，B数组值域
        yanzheng=1;
        %         建立p值计算所需要的数组
    else
        if row_A==1
            yanzheng=1;
        else
            [TimeVar_A,EventVar_A,GroupVar_A] = setvar(A);
        end
    end
    %     控制不符合条件的基因不会被输出
    % 控制不符合条件的基因不会被输出与保存
    if yanzheng==1
        p=1;
    else
                pb=Calculate_P(TimeVar_B,EventVar_B,GroupVar_B);
%                 pa=Calculate_P(TimeVar_A,EventVar_A,GroupVar_A);
pa=1;
        if pb>pa
            p=pa;
        else
            p=pb;
        end
    end
end
