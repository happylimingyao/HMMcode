load data                   %�û���ʵѵ������
load data1                  %�û���ʵ��������
load data2                   %�Ƿ��û���������
load data3                   %�Ƿ��û���������
data=permute(data,[2 1 3]); %��ά�����ת��ʹ��permute����
data1=permute(data1,[2 1 3]); %��ά�����ת��ʹ��permute����
data2=permute(data2,[2 1 3]);%��ά�����ת��ʹ��permute����
data3=permute(data3,[2 1 3]);%��ά�����ת��ʹ��permute����

nuM=3;                       %��ʾ��ϸ�˹�ĸ���M
% M=[3 3 3 3];                %״̬��N=length(M);
M=[nuM nuM nuM];
[hmm, pout] = trainhmm(data, M)

%ͨ����ʵ�û����ݻ�ȡģ����ֵ
a1=1;
a2=1;
a3=1;
yuzhi=12;

%��ʵ�û��Ĳ�������FRR
m=0;
n=0;
for j1=1:size(data1,3)
    [prob_ture(j1),path1] = viterbi(hmm, data1(:,:,j1));
    loglik1(j1)=prob_ture(j1)/length(path1);
    if(loglik1(j1)>=yuzhi)
        m=m+1;
    else
        n=n+1;
    end
end
FRR=n/(m+n);

% �Ƿ��û��Ĳ�������С��FAR2
n2=0;
m2=0;
for j2=1:size(data2,3)
    [prob_false2(j2),path2] = viterbi(hmm, data2(:,:,j2));
    loglik2(j2)=prob_false2(j2)/length(path2);
    if(abs(loglik2(j2))>=yuzhi)
        m2=m2+1;
    else
        n2=n2+1;
    end
end
FAR2=m2/(m2+n2);

%�Ƿ���������FAR3
n3=0;
m3=0;
for j3=1:size(data3,3)
    [prob_false3(j3),path3] = viterbi(hmm, data3(:,:,j3));
    loglik3(j3)=prob_false3(j3)/length(path3);
    if(loglik3(j3)>=yuzhi)
        m3=m3+1;
    else
        n3=n3+1;
    end
end
FAR3=m3/(m3+n3);
