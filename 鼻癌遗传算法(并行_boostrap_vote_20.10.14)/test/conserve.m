function [totalp,poptotal,n] = conserve(popsize,pop,p,n,totalp,poptotal)
for sum=1:popsize
    %         ����pֵС��0.05
    if p(sum,1)<0.05
        %             ��p�Ͷ�Ӧ�Ļ�����б���
        totalp(n,1)=p(sum,1);
        poptotal(n,:)=pop(sum,:);
        %             ��������
        n=n+1;
    end
end
end