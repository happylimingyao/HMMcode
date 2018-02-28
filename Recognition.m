load loglik00
load loglik01
load loglik10
load loglik11
n1=0;
%真实用户
for i=1:85
    p00=loglik00(i);
    p01=loglik01(i);
    m00=TFFunction(p00);
    m01=MFFunction(p01);
    m1=ds(m00,m01);
    if m1==1
        n1=n1+1;
    end
end

%错误拒绝率
FRR=(85-n1)/85

n2=0;
%非法用户
for j=1:85
    p10=loglik10(j);
    p11=loglik11(j);
    m10=TFFunction(p10);
    m11=MFFunction(p11);
        m2=ds(m10,m11);
    if m2==1
        n2=n2+1;
    end
end
%错误接受率
FAR=n2/85
