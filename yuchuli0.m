% function ah= yuchuli(N,file_name)
clear
clc
file_read=dir('test0\*.txt');
file_length=length(file_read);
for i=1:file_length
file_name=file_read(i).name
 f=fullfile('test0',file_name)
[t,x,y1,p]=textread(f,'%f%f%f%f');
raw(i)=length([t]);
end
minraw=min(raw);
N=minraw-2;
% N=59;
for i=1:file_length
    file_name=file_read(i).name
    f=fullfile('test0',file_name)
    [t,x,y1,p]=textread(f,'%f%f%f%f');
    y=0-y1;
%���б�׼���͹�һ��
XZ=nomalazation(x);    
YZ=nomalazation(y);
X=smooth(XZ,11,'moving');
Y=smooth(YZ,11,'moving');
P=smooth(p,11,'moving');
%��ȡ�ĽǶ�A��ʾ��diff��ʾ��,X1,Y1��ʾ�󵼺�ı�ʾ
X1=diff(X);
Y1=diff(Y);
for m=1:length(X1)
    angle(m)=atan(Y1(m)/X1(m));
    if isnan(angle(m))
        angle(m)=0.01;
    end
end
A=angle;
%V��ʾ�ٶȵĴ�С,diff��ʾ��
for n=1:length(X1)
    Vel(n)=sqrt(X1(n)^2+Y1(n)^2);
        if isnan(Vel(n))
            Vel(n)=0.01;
        end
end
V=Vel;

%Cuv��ʾ���ʰ뾶�Ĵ�С��A1���󵼺�Ƕ�ֵ�ı�ʾ,
% R��ʾ�����õ����ʰ뾶
A1=diff(A);
for l=1:length(A1)
    Cuv(l)=log(V(l)/A1(l));
    if isnan(Cuv(l))
        Cuv(l)=0.01;
    end
end
R=Cuv;
% V1��ʾ�ٶ�V�󵼺��ֵ,a��ʾ�ܵļ��ٶȵĴ�С
V1=diff(V);
for g=1:length(A1);
    Acc(g)=sqrt(V1(g)^2+(V(g)*A1(g))^2)
        if isnan(Acc(g))
            Acc(g)=0.01;
        end
end
Acc1=Acc;

% �Ծ������ʽ������txt�ĵ���
% N��ʾȡ���ĵ���
x2=quyangdian(N,X);
y2=quyangdian(N,Y);
p2=quyangdian(N,P);
j2=quyangdian(N,A);
v2=quyangdian(N,V);
r2=quyangdian(N,R);
a2=quyangdian(N,Acc1);
ah=[x2',y2',p2',j2',v2',a2'];
   path=sprintf('%s%d.txt','data0\',i);
   save(path,'ah','-ascii'); 
end













