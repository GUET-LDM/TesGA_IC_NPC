function [pb,number,sum1] = Verify(pop,tx,train)
%��ȡ���
[px_px,py_tx] = size(tx);
%�����Ʊ��볤��
%���ݱ�����Ŀ����C
chromlength=py_tx-4;
%��ʼ��Ⱥ
%������
% px=zeros(px_px,chromlength);
px=zeros(181,py_tx);
[px_px,py_px] = size(px);
[px_x,py_x] = size(pop);
number=zeros(px_x,1);
px_px=300;
for i = 1:1
    i
    %     ÿ�γ�ȡ718������
%     for i1=1:px_px
%         px(i1,:)=tx(round(1+(px_px-1).*rand),(5:py_tx));
%     end
%     for i1=1:181
%         px(i1,:)=tx(round(1+(px_px-1).*rand),(5:py_tx));
%     end
    for j=1:181
    index=randi(301-j,1);
    px(j,:)=train(index,:);
    train(index,:)=[];
    end
    G=[px;tx];
    px=G;
    px(:,[1:4])=[];
    % ͬʱ��֤���н��Ů
    for i3=1:px_x
        row_B=1;
        for i1=1:px_px
            %��tx��������ѭ��ͳ��
            for i2=1:py_x
                %������ѭ��
                if i2==1
                    sum=0;
                    equal=0;
                end
                sum=sum+pop(i3,i2);
                if pop(i3,i2)==1
                    if px(i1,i2)==0
                        %ͳ��ȫ��ĸ�����Ŀ
                        equal=equal+1;
                    end
                end
            end
            if i2==py_x
                %�ֱ��AB���鸳ֵ
                if equal~=sum
                    B(row_B,1)=px(i1,2);
                    B(row_B,2)=px(i1,4);
                    B(row_B,3)=px(i1,3);
                    row_B=row_B+1;
                end
            end
        end
        % ����Ӧ�����������
        [TimeVar_B,EventVar_B,GroupVar_B,a1,a2]= setvar(B);
        pb(i,i3)=Calculate_P(TimeVar_B,EventVar_B,GroupVar_B);
        %     С��0.05ͨ����֤
        if pb(i,i3)<0.05
            number(i3,1)=number(i3,1)+1;
        end
        %     ����������
        sum1(i,i3)=a1+a2;
    end
end
% ɾ������
clearvars -except number pb sum1
end