clear all;
close all;
clc;
file_read=dir('data0\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data0',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da=[x2,y2,p2,j2,v2,a2];
    data3(:,:,i)=da;
    data=permute(data3,[2 1 3]); %��ά�����ת��ʹ��permute����
end
save data data

%��ʵ����
file_read=dir('data1\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data1',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da1=[x2,y2,p2,j2,v2,a2];
    data_ture(:,:,i)=da1;
    data1=permute(data_ture,[2 1 3]); %��ά�����ת��ʹ��permute����
end
save data1 data1

%С���Ƿ��û�
file_read=dir('data2\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data2',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da2=[x2,y2,p2,j2,v2,a2];
    data_false(:,:,i)=da2;
    data2=permute(data_false,[2 1 3]); %��ά�����ת��ʹ��permute����
end
save data2 data2

%��������
file_read=dir('data3\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data3',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da3=[x2,y2,p2,j2,v2,a2];
    data_false1(:,:,i)=da3;
    data3=permute(data_false1,[2 1 3]); %��ά�����ת��ʹ��permute����
end
save data3 data3

%����������
file_read=dir('data4\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data4',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da4=[x2,y2,p2,j2,v2,a2];
    data_false2(:,:,i)=da4;
    data4=permute(data_false2,[2 1 3]); %��ά�����ת��ʹ��permute����
end
save data4 data4

%������ѵ��ģ������
file_read=dir('data5\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data5',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da5=[x2,y2,p2,j2,v2,a2];
    data_false3(:,:,i)=da5;
    data5=permute(data_false3,[2 1 3]); %��ά�����ת��ʹ��permute����
end
save data5 data5
