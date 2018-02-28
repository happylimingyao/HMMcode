function [hmm, pout] = trainhmm(data, M)
% 用于train.m函数，

%输入:
%  data -- 样本结构
%  M       -- 为每个状态指定pdf个数,如:[3 3 3 3]
%输出:
%  hmm      -- 训练完成后的hmm
% load data
% K   = length(samples);
K=size(data,3);

% 计算语音参数
% disp('正在计算语音参数');
% disp('正在计算手势参数')
% for k = 1:K
% 	if isfield(samples(k),'data') & ~isempty(samples(k).data)
% 		continue;
% 	else
% 		samples(k).data = mfcc(samples(k).wave);
% 	end
% end

% hmm = inithmm(samples, M);
% M=[3 3 3 3];
hmm=inithmm(data,M);

for loop = 1:20
	fprintf('\n第%d遍训练\n',loop);
	hmm = baum(hmm, data,M);
    save hmm.mat hmm;
	%计算总输出概率
	pout(loop)=0;
	for k = 1:K
% 		pout(loop) = pout(loop) + viterbi(hmm, samples(k).data);
        pout(loop) = pout(loop) + viterbi(hmm, data(:,:,k));
	end

	%fprintf('总和输出概率(log)=%d\n', pout(loop))

	%比较两个HMM的距离
	if loop>1
		if abs((pout(loop)-pout(loop-1))/pout(loop)) < 5e-6
			fprintf('收敛!\n');
			return
		end
	end
end

disp('迭代40次仍不收敛, 退出');
end