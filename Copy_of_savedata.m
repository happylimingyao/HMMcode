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
    data=permute(data3,[2 1 3]); %高维数组的转置使用permute函数
end
save data data

%真实数据
file_read=dir('data1\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data1',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da1=[x2,y2,p2,j2,v2,a2];
    data_ture(:,:,i)=da1;
    data1=permute(data_ture,[2 1 3]); %高维数组的转置使用permute函数
end
save data1 data1

%小威非法用户
file_read=dir('data2\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data2',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da2=[x2,y2,p2,j2,v2,a2];
    data_false(:,:,i)=da2;
    data2=permute(data_false,[2 1 3]); %高维数组的转置使用permute函数
end
save data2 data2

%晓君数据
file_read=dir('data3\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data3',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da3=[x2,y2,p2,j2,v2,a2];
    data_false1(:,:,i)=da3;
    data3=permute(data_false1,[2 1 3]); %高维数组的转置使用permute函数
end
save data3 data3

%徐宜敏数据
file_read=dir('data4\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data4',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da4=[x2,y2,p2,j2,v2,a2];
    data_false2(:,:,i)=da4;
    data4=permute(data_false2,[2 1 3]); %高维数组的转置使用permute函数
end
save data4 data4

%徐宜敏训练模板数据
file_read=dir('data5\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data5',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da5=[x2,y2,p2,j2,v2,a2];
    data_false3(:,:,i)=da5;
    data5=permute(data_false3,[2 1 3]); %高维数组的转置使用permute函数
end
save data5 data5
