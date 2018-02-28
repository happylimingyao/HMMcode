load data1
load datali1  %本人的测试数据
load datawu1  %小威的测试数据
load hmm1
mu1=hmm1.mu1;
Sigma1=hmm1.Sigma1;
mixmat1=hmm1.mixmat1;
prior1=hmm1.prior1;
transmat1=hmm1.transmat1;
for j=1:size(data1,3)
    B = mixgauss_prob(data1(:,:,j), mu1, Sigma1, mixmat1);
    [path,loglik] = viterbi_path(prior1, transmat1, B);
    loglik01(j)=loglik/length(path);
end
    meanloglik=mean(loglik01)
    varloglik=std(loglik01)
    a=1;
    a1=1;
    a4=1;
    a3=1;
    t=1;
% for w=0:0.1:6
 w=0.6;
  yuzhi=meanloglik-w*varloglik;

%  测试真实的用户data10
    m=0;
    n=0;
for j0=1:size(datali1,3)
    B = mixgauss_prob(datali1(:,:,j0), mu1, Sigma1, mixmat1);
    [path_0,loglik_0] = viterbi_path(prior1, transmat1, B);
    loglik01(j0)=loglik_0/length(path_0);
    if(loglik01(j0)>=yuzhi)
    m=m+1;
    else
    n=n+1;
    end
end
save loglik01 loglik01
    FRR(a)=n/(m+n);
    a=a+1;
   
 %非法用户1的测试data10
 n1=0;
 m1=0;
 for j2=1:size(datawu1,3)
     B = mixgauss_prob(datawu1(:,:,j2), mu1, Sigma1, mixmat1);
     [path_2,loglik_2] = viterbi_path(prior1, transmat1, B);
     loglik11(j2)=loglik_2/length(path_2);
     if(loglik11(j2)>=yuzhi)
     m1=m1+1;
     else
     n1=n1+1;
    end
 end
 
 save loglik11 loglik11
    FAR(a1)=m1/(m1+n1);
    a1=a1+1;
%  end
w=0:0.1:6;
plot(w,FRR*100,'-*')
axis([0,6,0,100])
hold on
plot(w,FAR*100,'-d')
hold on
xlabel('w')
ylabel('错误率（%）')
legend('FRR','FAR',1)
save('sa.mat');