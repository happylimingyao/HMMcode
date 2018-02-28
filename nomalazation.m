function x=nomalazation(y)
n=length(y);
sum=0;
for i=1:n
    sum=sum+y(i);
end
ave=sum/n;
for i=1:n
    s(i)=y(i)-ave;
end
for i=1:n
    x(i)=(s(i)-min(s))/(max(s)-min(s));
end