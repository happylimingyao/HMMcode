function m1 = TFFunction( p1 )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if p1<=4
    m1=0.0455;
else if p1<=4.3
        m1=0.001;
    else if p1<=4.6
            m1=0.2222;
        else if p1<=4.9
            m1=0.8750;
            else 
                m1=1.0
        end
    end
end
end

