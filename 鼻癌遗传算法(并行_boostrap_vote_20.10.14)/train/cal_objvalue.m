%���㺯��Ŀ��ֵ
%������������鲡�˵�����
%���������p�ĵ���ֵ
% һ��һ�н��pֵ���㣬ȡp����Сֵ
%���ɿ��Լ���pֵ��3*n����
function [p,pop] = cal_objvalue(pop,px_tx,tx,size_A,size_B)
clear C;
[px_pop,py_pop] = size(pop);
p=zeros(200,1);
parfor i3=1:px_pop
[p(i3,1)] = logranktest(pop,px_tx,tx,py_pop,size_A,size_B,i3)
end
% ��p�ĵ����������������main��
% �����������
sumpop=sum(pop,2);
for i4=1:px_pop
    if sumpop(i4,1)>15
        pop(i4,:)=0;
        %          ����ص�Ϊ����
        amount=round(1+(2).*rand);
        for i=1:amount
            %                 ����������ǻص����������ɵ�������λ��
            m=round(1+(py_pop-1).*rand) ;
            pop(i4,m)=1;
        end
    end
end
clearvars -except p pop
end
function [p] = logranktest(pop,px_tx,tx,py_pop,size_A,size_B,i3)
yanzheng=0;
    %��pop��Ⱥ���м���
    row_A=1;
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
    %     �Ա����������лص���ֹ����
%     if sum>15
%         pop(i3,:)=0;
%         %          ����ص�Ϊ����
%         amount=round(1+(2).*rand);
%         for i=1:amount
%             %                 ����������ǻص����������ɵ�������λ��
%             m=round(1+(py_pop-1).*rand) ;
%             pop(i3,m)=1;
%         end
%     end
    %      ���Ʋ����������Ļ��򲻻ᱻ���
    if row_B<size_B
        %ȷ��A��B����ֵ��
        yanzheng=1;
        %         ����pֵ��������Ҫ������
    else
        if row_B==1
            yanzheng=1;
        else
            [TimeVar_B,EventVar_B,GroupVar_B] = setvar(B);
        end
    end
    if row_A<size_A
        %ȷ��A��B����ֵ��
        yanzheng=1;
        %         ����pֵ��������Ҫ������
    else
        if row_A==1
            yanzheng=1;
        else
            [TimeVar_A,EventVar_A,GroupVar_A] = setvar(A);
        end
    end
    %     ���Ʋ����������Ļ��򲻻ᱻ���
    % ���Ʋ����������Ļ��򲻻ᱻ����뱣��
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
