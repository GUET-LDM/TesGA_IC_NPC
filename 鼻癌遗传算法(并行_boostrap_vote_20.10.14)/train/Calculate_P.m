 function [p] = Calculate_P(TimeVar_B,EventVar_B,GroupVar_B)
%计算p值
[p]=MatSurv_p(TimeVar_B,EventVar_B, GroupVar_B);
%此函数只输出p值
 end