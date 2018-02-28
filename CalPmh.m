load data1
load datali1
load datawu1
load hmm1


mu1=hmm1.mu1;
Sigma1=hmm1.Sigma1;
mixmat1=hmm1.mixmat1;
prior1=hmm1.prior1;
transmat1=hmm1.transmat1;
for j=1:size(data1,3)
    B = mixgauss_prob(data1(:,:,j), mu1, Sigma1, mixmat1);
    [path,loglik] = viterbi_path(prior1, transmat1, B);
    loglikli1(j)=loglik/length(path);
end
    meanloglik=mean(loglikli1)
    varloglik=std(loglikli1)
    w=3.5;
  yuzhi=meanloglik-w*varloglik;
%  测试真实的用户datali1
for j0=1:size(datali1,3)
    B = mixgauss_prob(datali1(:,:,j0), mu1, Sigma1, mixmat1);
    [path_0,loglik_0] = viterbi_path(prior1, transmat1, B);
    loglikli1(j0)=loglik_0/length(path_0);
end
save loglikli1 loglikli1
  
 %非法用户1的测试datawu1
 for j2=1:size(datawu1,3)
     B = mixgauss_prob(datawu1(:,:,j2), mu1, Sigma1, mixmat1);
     [path_2,loglik_2] = viterbi_path(prior1, transmat1, B);
     loglikwu1(j2)=loglik_2/length(path_2);
 end
 save loglikwu1 loglikwu1
   