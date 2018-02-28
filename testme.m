load data                   %用户真实训练数据
load data1                  %用户真实测试数据
load data2                   %非法用户测试数据
load data3                   %非法用户测试数据
data=permute(data,[2 1 3]); %高维数组的转置使用permute函数
data1=permute(data1,[2 1 3]); %高维数组的转置使用permute函数
data2=permute(data2,[2 1 3]);%高维数组的转置使用permute函数
data3=permute(data3,[2 1 3]);%高维数组的转置使用permute函数

nuM=6;                       %表示混合高斯的个数M
% M=[3 3 3 3];                %状态数N=length(M);
M=[nuM nuM nuM];
[hmm, pout] = trainhmm(data, M)

%真实用户训练HMM模型
    for i=1:size(data,3)
       [prob_ture(i),path] = viterbi(hmm, data(:,:,i));
       loglik_ture(i)=prob_ture(i)/length(path);
    end
        meanloglik=mean(loglik_ture);
        varloglik=std(loglik_ture);
   a=1;  
   a1=1;  
    for w=1:0.2:5      %阈值系数w的设定
            yuzhi=meanloglik-w*varloglik

% yuzhi=12;
% 真实用户的测试数据
        m=0;
        n=0;
    
	for j=1:size(data1,3)
        [pout(j),path_ture] = viterbi(hmm, data1(:,:,j));
        loglik_ture(j)=pout(j)/length(path_ture);
        if(loglik_ture(j)>yuzhi)
            m=m+1;
        else
            n=n+1;
        end
    end
        FRR(a)=n/(m+n);
        a=a+1;
    end
figure
w=1:0.2:5;
plot(w,FRR,'-*')
axis([1,5,0,1])
hold on

xlabel('w')
ylabel('错误率（%）')
legend('FRR',1)

   

 
