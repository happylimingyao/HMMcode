function m = ds(m1,m2)
%DS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
m1=m1*m2;
m2=(1-m1)*(1-m2);
mfall=m1/(m1+m2);
mactivity=1-mfall;
if(mfall>=mactivity)
    m=1;
else
    m=0;    
end

