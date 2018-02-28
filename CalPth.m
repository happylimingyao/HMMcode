load data0
load datali0
load datawu0
load hmm

mu1=hmm.mu1;
Sigma1=hmm.Sigma1;
mixmat1=hmm.mixmat1;
prior1=hmm.prior1;
transmat1=hmm.transmat1;
for j=1:size(data0,3)
    B = mixgauss_prob(data0(:,:,j), mu1, Sigma1, mixmat1);
    [path,loglik] = viterbi_path(prior1, transmat1, B);
    loglikli0(j)=loglik/length(path);
end
    meanloglik=mean(loglikli0)
    varloglik=std(loglikli0)
    w=3.2;
    yuzhi=meanloglik-w*varloglik;
%  测试真实的用户datali0
for j0=1:size(datali0,3)
    B = mixgauss_prob(datali0(:,:,j0), mu1, Sigma1, mixmat1);
    [path_0,loglik_0] = viterbi_path(prior1, transmat1, B);
    loglikli0(j0)=loglik_0/length(path_0);
end
save loglikli0 loglikli0

 %非法用户1的测试datawu0
 for j2=1:size(datawu0,3)
     B = mixgauss_prob(datawu0(:,:,j2), mu1, Sigma1, mixmat1);
     [path_2,loglik_2] = viterbi_path(prior1, transmat1, B);
     loglikwu0(j2)=loglik_2/length(path_2);
 end
 save loglikwu0 loglikwu0
   