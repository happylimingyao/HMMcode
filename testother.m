load data                   %用户真实训练数据
load data1                  %用户真实测试数据
load data2                   %非法用户测试数据
load data3                   %非法用户测试数据
data=permute(data,[2 1 3]); %高维数组的转置使用permute函数
data1=permute(data1,[2 1 3]); %高维数组的转置使用permute函数
data2=permute(data2,[2 1 3]);%高维数组的转置使用permute函数
data3=permute(data3,[2 1 3]);%高维数组的转置使用permute函数

nuM=3;                       %表示混合高斯的个数M
% M=[3 3 3 3];                %状态数N=length(M);
M=[nuM nuM nuM];
[hmm, pout] = trainhmm(data, M)

%通过真实用户数据获取模型阈值
a1=1;
a2=1;
a3=1;
yuzhi=12;

%真实用户的测试数据FRR
m=0;
n=0;
for j1=1:size(data1,3)
    [prob_ture(j1),path1] = viterbi(hmm, data1(:,:,j1));
    loglik1(j1)=prob_ture(j1)/length(path1);
    if(loglik1(j1)>=yuzhi)
        m=m+1;
    else
        n=n+1;
    end
end
FRR=n/(m+n);

% 非法用户的测试数据小威FAR2
n2=0;
m2=0;
for j2=1:size(data2,3)
    [prob_false2(j2),path2] = viterbi(hmm, data2(:,:,j2));
    loglik2(j2)=prob_false2(j2)/length(path2);
    if(abs(loglik2(j2))>=yuzhi)
        m2=m2+1;
    else
        n2=n2+1;
    end
end
FAR2=m2/(m2+n2);

%非法数据晓君FAR3
n3=0;
m3=0;
for j3=1:size(data3,3)
    [prob_false3(j3),path3] = viterbi(hmm, data3(:,:,j3));
    loglik3(j3)=prob_false3(j3)/length(path3);
    if(loglik3(j3)>=yuzhi)
        m3=m3+1;
    else
        n3=n3+1;
    end
end
FAR3=m3/(m3+n3);
