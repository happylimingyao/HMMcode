function [hmm, pout] = trainhmm(data, M)
% ����train.m������

%����:
%  data -- �����ṹ
%  M       -- Ϊÿ��״ָ̬��pdf����,��:[3 3 3 3]
%���:
%  hmm      -- ѵ����ɺ��hmm
% load data
% K   = length(samples);
K=size(data,3);

% ������������
% disp('���ڼ�����������');
% disp('���ڼ������Ʋ���')
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
	fprintf('\n��%d��ѵ��\n',loop);
	hmm = baum(hmm, data,M);
    save hmm.mat hmm;
	%�������������
	pout(loop)=0;
	for k = 1:K
% 		pout(loop) = pout(loop) + viterbi(hmm, samples(k).data);
        pout(loop) = pout(loop) + viterbi(hmm, data(:,:,k));
	end

	%fprintf('�ܺ��������(log)=%d\n', pout(loop))

	%�Ƚ�����HMM�ľ���
	if loop>1
		if abs((pout(loop)-pout(loop-1))/pout(loop)) < 5e-6
			fprintf('����!\n');
			return
		end
	end
end

disp('����40���Բ�����, �˳�');
end