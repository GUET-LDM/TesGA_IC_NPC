function [poptotal,totalp] = pop_p_overlat(poptotal,totalp,chromlength)
% �жϴ�С
[px_pl,py_pl] = size(poptotal);
% ����
n=1;
% ȥ��ѭ��
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
% ���±���
poptotal=newpoptotal;
totalp=newtotalp;
end

