load data0
load datali0  %本人的测试数据
load datawu0  %吴平的测试数据
load hmm
mu1=hmm.mu1;
Sigma1=hmm.Sigma1;
mixmat1=hmm.mixmat1;
prior1=hmm.prior1;
transmat1=hmm.transmat1;
for j=1:size(data0,3)
    B = mixgauss_prob(data0(:,:,j), mu1, Sigma1, mixmat1);
    [path,loglik] = viterbi_path(prior1, transmat1, B);
    loglik00(j)=loglik/length(path);
end
    meanloglik=mean(loglik00)
    varloglik=std(loglik00)
    a=1;
    a1=1;
    a4=1;
    a3=1;
    t=1;
%   for w=0:0.1:6
  w=0.3;
  yuzhi=meanloglik-w*varloglik;

%  测试真实的用户datali0
    m=0;
    n=0;
for j0=1:size(datali0,3)
    B = mixgauss_prob(datali0(:,:,j0), mu1, Sigma1, mixmat1);
    [path_0,loglik_0] = viterbi_path(prior1, transmat1, B);
    loglik00(j0)=loglik_0/length(path_0);
    if(loglik00(j0)>=yuzhi)
    m=m+1;
    else
    n=n+1;
    end
end
save loglik00 loglik00
    FRR(a)=n/(m+n);
    a=a+1;
   
 %非法用户1的测试datawu0
 n1=0;
 m1=0;
 for j2=1:size(datawu0,3)
     B = mixgauss_prob(datawu0(:,:,j2), mu1, Sigma1, mixmat1);
     [path_2,loglik_2] = viterbi_path(prior1, transmat1, B);
     loglik10(j2)=loglik_2/length(path_2);
     if(loglik10(j2)>=yuzhi)
     m1=m1+1;
     else
     n1=n1+1;
    end
 end
 save loglik10 loglik10
    FAR(a1)=m1/(m1+n1);
    a1=a1+1;
% end
w=0:0.1:6;
plot(w,FRR*100,'-*')
axis([0,6,0,100])
hold on
plot(w,FAR*100,'-d')
hold on
% plot(w,FARR,'-p')
% hold on
% plot(w,FARRR,'-s')
xlabel('w')
ylabel('错误率（%）')
legend('FRR','FAR',1)
% end
save('sa.mat');