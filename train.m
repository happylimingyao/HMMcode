load data0                   %用户真实训练数据
data0=permute(data0,[2 1 3]); %高维数组的转置使用permute函数
m=2;                       %表示混合高斯的个数M
% M=[3 3 3 3];                %状态数N=length(M);
M=[m m m m m];
[hmm, pout] = trainhmm(data0, M);