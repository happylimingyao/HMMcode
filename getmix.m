function mix = getmix(vector, M)

[nn esq] = kmeans(vector,M);

% ����ÿ������ı�׼��, �Խ���, ֻ����Խ����ϵ�Ԫ��
for j = 1:M
	ind = find(j==nn);
	tmp = vector(ind,:);
	var(j,:) = std(tmp);
    m(j,:) = mean(tmp);
end

% ����ÿ�������е�Ԫ����, ��һ��Ϊ��pdf��Ȩ��
weight = zeros(M,1);
for j = 1:M
	weight(j) = sum(find(j==nn));
end
weight = weight/sum(weight);

% ������
mix.M      = M;
mix.mean   = m;		% M*SIZE
mix.var    = var.^2;	% M*SIZE
mix.weight = weight;	% M*1

