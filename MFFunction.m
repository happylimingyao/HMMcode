function m2 = MFFunction( P2 )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
if P2<=4
    m2=0.3333;
else if P2<=4.5
        m2=0.001;
    else if P2<=5.0
            m2=0.1579;
        else
            m2=0.9730;
        end
    end
end
end

