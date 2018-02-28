load data0
%Let us generate nex=50 vector-valued sequences of length T=50; 
% each vector has size O=2.
O = 6;
T = 86;%���г���
nex = 15;%����������Ŀ
% data0 = randn(O,T,nex);
% Now let use fit a mixture of M=2 Gaussians for each of the Q=2 states using K-means.
% for M=2:2:10

M =6; %��ʾ��ϸ�˹�ĸ���
Q = 5; %��ʾ״̬��
left_right = 0;
cov_type = 'diag';
% prior0 = normalise(rand(Q,1));
prior0=ones(Q,1)*0;
prior0(1)=1;
% ת�Ƹ��ʾ���
transmat0=zeros(Q,Q);
for i=1:Q-1
	transmat0(i,i)   = 0.5;
	transmat0(i,i+1) = 0.5;
end
transmat0(Q,Q) = 1;
% transmat0 = mk_stochastic(rand(Q,Q));
% ��ʼ���õ�
[mu0, Sigma0] = mixgauss_init(Q*M, reshape(data0, [O T*nex]), cov_type);
mu0 = reshape(mu0, [O Q M]);
Sigma0 = reshape(Sigma0, [O O Q M]);
mixmat0 = mk_stochastic(rand(Q,M));
% Finally, let us improve these parameter estimates using EM.
[LL, prior1, transmat1, mu1, Sigma1, mixmat1] =mhmm_em(data0, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', 2);
hmm.LL=LL;
hmm.prior1=prior1;
hmm.transmat1=transmat1;
hmm.mu1=mu1;
hmm.Sigma1=Sigma1;
hmm.mixmat1=mixmat1;
save hmm hmm

%�γ���ֵ
for j=1:size(data0,3)
    B = mixgauss_prob(data0(:,:,j), mu1, Sigma1, mixmat1);
    [path,loglik] = viterbi_path(prior1, transmat1, B);
    loglik0(j)=loglik/length(path);
end
    meanloglik=mean(loglik0)
    varloglik=std(loglik0)
    