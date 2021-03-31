function [pb,number,sum1] = Verify(pop,tx,train)
%读取表格
[px_px,py_tx] = size(tx);
%二进制编码长度
%根据变量数目更改C
chromlength=py_tx-4;
%初始种群
%迭代数
% px=zeros(px_px,chromlength);
px=zeros(181,py_tx);
[px_px,py_px] = size(px);
[px_x,py_x] = size(pop);
number=zeros(px_x,1);
px_px=300;
for i = 1:1
    i
    %     每次抽取718个病人
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
    % 同时验证所有结果女
    for i3=1:px_x
        row_B=1;
        for i1=1:px_px
            %对tx数组纵向循环统计
            for i2=1:py_x
                %对特征循环
                if i2==1
                    sum=0;
                    equal=0;
                end
                sum=sum+pop(i3,i2);
                if pop(i3,i2)==1
                    if px(i1,i2)==0
                        %统计全零的个体数目
                        equal=equal+1;
                    end
                end
            end
            if i2==py_x
                %分别对AB数组赋值
                if equal~=sum
                    B(row_B,1)=px(i1,2);
                    B(row_B,2)=px(i1,4);
                    B(row_B,3)=px(i1,3);
                    row_B=row_B+1;
                end
            end
        end
        % 建立应该输入的数组
        [TimeVar_B,EventVar_B,GroupVar_B,a1,a2]= setvar(B);
        pb(i,i3)=Calculate_P(TimeVar_B,EventVar_B,GroupVar_B);
        %     小于0.05通过验证
        if pb(i,i3)<0.05
            number(i3,1)=number(i3,1)+1;
        end
        %     对总数计算
        sum1(i,i3)=a1+a2;
    end
end
% 删除变量
clearvars -except number pb sum1
end