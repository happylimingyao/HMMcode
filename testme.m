load data                   %�û���ʵѵ������
load data1                  %�û���ʵ��������
load data2                   %�Ƿ��û���������
load data3                   %�Ƿ��û���������
data=permute(data,[2 1 3]); %��ά�����ת��ʹ��permute����
data1=permute(data1,[2 1 3]); %��ά�����ת��ʹ��permute����
data2=permute(data2,[2 1 3]);%��ά�����ת��ʹ��permute����
data3=permute(data3,[2 1 3]);%��ά�����ת��ʹ��permute����

nuM=6;                       %��ʾ��ϸ�˹�ĸ���M
% M=[3 3 3 3];                %״̬��N=length(M);
M=[nuM nuM nuM];
[hmm, pout] = trainhmm(data, M)

%��ʵ�û�ѵ��HMMģ��
    for i=1:size(data,3)
       [prob_ture(i),path] = viterbi(hmm, data(:,:,i));
       loglik_ture(i)=prob_ture(i)/length(path);
    end
        meanloglik=mean(loglik_ture);
        varloglik=std(loglik_ture);
   a=1;  
   a1=1;  
    for w=1:0.2:5      %��ֵϵ��w���趨
            yuzhi=meanloglik-w*varloglik

% yuzhi=12;
% ��ʵ�û��Ĳ�������
        m=0;
        n=0;
    
	for j=1:size(data1,3)
        [pout(j),path_ture] = viterbi(hmm, data1(:,:,j));
        loglik_ture(j)=pout(j)/length(path_ture);
        if(loglik_ture(j)>yuzhi)
            m=m+1;
        else
            n=n+1;
        end
    end
        FRR(a)=n/(m+n);
        a=a+1;
    end
figure
w=1:0.2:5;
plot(w,FRR,'-*')
axis([1,5,0,1])
hold on

xlabel('w')
ylabel('�����ʣ�%��')
legend('FRR',1)

   

 
