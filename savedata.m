clear
clc
% 个人食指模板数据
file_read=dir('data0\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data0',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da=[x2,y2,p2,j2,v2,a2];
    data_0(:,:,i)=da;
    data0=permute(data_0,[2 1 3]); %高维数组的转置使用permute函数
end
save data0 data0

%个人中指模板数据
file_read=dir('data1\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('data1',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da=[x2,y2,p2,j2,v2,a2];
    data_1(:,:,i)=da;
    data1=permute(data_1,[2 1 3]); %高维数组的转置使用permute函数
end
save data1 data1

%真实食指数据
file_read=dir('tdatali0\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('tdatali0',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da1=[x2,y2,p2,j2,v2,a2];
    data_ture(:,:,i)=da1;
    datali0=permute(data_ture,[2 1 3]); %高维数组的转置使用permute函数
end
save datali0 datali0

%真实中指用户
file_read=dir('tdatali1\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('tdatali1',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da2=[x2,y2,p2,j2,v2,a2];
    data_false(:,:,i)=da2;
    datali1=permute(data_false,[2 1 3]); %高维数组的转置使用permute函数
end
save datali1 datali1

%wupin数据data_0
file_read=dir('tdatawu0\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('tdatawu0',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da3=[x2,y2,p2,j2,v2,a2];
    data_false1(:,:,i)=da3;
    datawu0=permute(data_false1,[2 1 3]); %高维数组的转置使用permute函数
end
save datawu0 datawu0

%wupin数据datawu1
file_read=dir('tdatawu1\*.txt');
file_length=length(file_read);
for i=1:file_length
    file_name=file_read(i).name;
    f=fullfile('tdatawu1',file_name);
    [x2,y2,p2,j2,v2,a2]=textread(f,'%f%f%f%f%f%f')
    da4=[x2,y2,p2,j2,v2,a2];
    data_false2(:,:,i)=da4;
    datawu1=permute(data_false2,[2 1 3]); %高维数组的转置使用permute函数
end
save datawu1 datawu1

