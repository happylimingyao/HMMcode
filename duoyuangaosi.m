% ���ɶ�ά��˹�ֲ������ܶȺ���
clear all;
close all;
clc;
randn('seed',0);
%%һά��˹����
mu=0;
sigma=1;
x=-6:0.1:6;
y=normpdf(x,mu,sigma);
plot(x,y);
figure;

%%��ά���ά��˹����
mu=[0 0];
sigma=[0.3 0;0 0.35];
[x y]=meshgrid(linspace(-8,8,80)',linspace(-8,8,80)');
X=[x(:) y(:)];
z=mvnpdf(X,mu,sigma);
surf(x,y,reshape(z,80,80));
hold on;
%������һ��
mu=[4 0];
sigma=[1.2 0;0 1.85];
[x y]=meshgrid(linspace(-8,8,80)',linspace(-8,8,80)');
X=[x(:) y(:)];
z=mvnpdf(X,mu,sigma);
surf(x,y,reshape(z,80,80));