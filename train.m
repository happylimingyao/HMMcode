load data0                   %�û���ʵѵ������
data0=permute(data0,[2 1 3]); %��ά�����ת��ʹ��permute����
m=2;                       %��ʾ��ϸ�˹�ĸ���M
% M=[3 3 3 3];                %״̬��N=length(M);
M=[m m m m m];
[hmm, pout] = trainhmm(data0, M);