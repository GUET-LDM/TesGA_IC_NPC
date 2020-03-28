function [poptotal,totalp] = pop_p_overlat(poptotal,totalp,chromlength)
% 判断大小
[px_pl,py_pl] = size(poptotal);
% 计数
n=1;
% 去重循环
for i=1:px_pl
    for i1=i:px_pl
            if totalp(i,1)==totalp(i1,1)
                a=0;
                for i2=1:chromlength
                if poptotal(i,i2)~=poptotal(i1,i2)
                    a=1;
                end
                end
            end
    end
    newpoptotal(n,:)=poptotal(i,:);
    newtotalp(n,1)=totalp(i,1);
    n=n+1;
    if a==1
        n=n-1;
    end
end
% 更新变量
poptotal=newpoptotal;
totalp=newtotalp;
end

