function [totalp,poptotal,n] = conserve(popsize,pop,p,n,totalp,poptotal)
for sum=1:popsize
    %         控制p值小于0.05
    if p(sum,1)<0.05
        %             对p和对应的基因进行保留
        totalp(n,1)=p(sum,1);
        poptotal(n,:)=pop(sum,:);
        %             计数返回
        n=n+1;
    end
end
end