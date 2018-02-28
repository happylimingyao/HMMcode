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
%进行标准化和归一化
XZ=nomalazation(x);    
YZ=nomalazation(y);
X=smooth(XZ,11,'moving');
Y=smooth(YZ,11,'moving');
P=smooth(p,11,'moving');
%获取的角度A表示，diff表示求导,X1,Y1表示求导后的表示
X1=diff(X);
Y1=diff(Y);
for m=1:length(X1)
    angle(m)=atan(Y1(m)/X1(m));
    if isnan(angle(m))
        angle(m)=0.01;
    end
end
A=angle;
%V表示速度的大小,diff表示求导
for n=1:length(X1)
    Vel(n)=sqrt(X1(n)^2+Y1(n)^2);
        if isnan(Vel(n))
            Vel(n)=0.01;
        end
end
V=Vel;

%Cuv表示曲率半径的大小，A1是求导后角度值的表示,
% R表示最后求得的曲率半径
A1=diff(A);
for l=1:length(A1)
    Cuv(l)=log(V(l)/A1(l));
    if isnan(Cuv(l))
        Cuv(l)=0.01;
    end
end
R=Cuv;
% V1表示速度V求导后的值,a表示总的加速度的大小
V1=diff(V);
for g=1:length(A1);
    Acc(g)=sqrt(V1(g)^2+(V(g)*A1(g))^2)
        if isnan(Acc(g))
            Acc(g)=0.01;
        end
end
Acc1=Acc;

% 以矩阵的形式保存于txt文档中
% N表示取样的点数
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













