function mix = getmix(vector, M)

[nn esq] = kmeans(vector,M);

% 计算每个聚类的标准差, 对角阵, 只保存对角线上的元素
for j = 1:M
	ind = find(j==nn);
	tmp = vector(ind,:);
	var(j,:) = std(tmp);
    m(j,:) = mean(tmp);
end

% 计算每个聚类中的元素数, 归一化为各pdf的权重
weight = zeros(M,1);
for j = 1:M
	weight(j) = sum(find(j==nn));
end
weight = weight/sum(weight);

% 保存结果
mix.M      = M;
mix.mean   = m;		% M*SIZE
mix.var    = var.^2;	% M*SIZE
mix.weight = weight;	% M*1

