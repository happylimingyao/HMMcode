load loglik00
load loglik10


min00=min(loglik00);
max00=max(loglik00);
% seg=max00-min00;
seg=0.3

min10=min(loglik10);
max10=max(loglik10);
% 计算基本概率分配函数
a1=4;
numa1=0;
for i =1:40
    if loglik00(i)<=a1
        numa1=numa1+1;
    end
end

numb1=0;
for i =1:40
    if loglik10(i)<=a1
        numb1=numb1+1;
    end
end
p1=numa1/(numa1+numb1);
%第二区间
a2=a1+seg;
numa2=0;
for i =1:40
    if (loglik00(i)>a1)&&(loglik00(i)<=a2)
        numa2=numa2+1;
    end
end

numb2=0;
for i =1:40
    if (loglik10(i)>a1)&&(loglik10(i)<=a2)
        numb2=numb2+1;
    end
end
p2=numa2/(numa2+numb2);

%第三区间
a3=a2+seg;
numa3=0;
for i =1:40
    if (loglik00(i)>a2)&&(loglik00(i)<=a3)
        numa3=numa3+1;
    end
end

numb3=0;
for i =1:40
    if (loglik10(i)>a2)&&(loglik10(i)<=a3)
        numb3=numb3+1;
    end
end
p3=numa3/(numa3+numb3);

%第四区间
a4=a3+seg;
numa4=0;
for i =1:40
    if (loglik00(i)>a3)&&(loglik00(i)<=a4)
        numa4=numa4+1;
    end
end

numb4=0;
for i =1:40
     if (loglik10(i)>a3)&&(loglik10(i)<=a4)
        numb4=numb4+1;
    end
end
p4=numa4/(numa4+numb4);

%第5区间
numa5=0;
for i =1:40
    if loglik00(i)>a4
        numa5=numa5+1;
    end
end
numb5=0;
for i =1:40
     if loglik10(i)>a4
        numb5=numb5+1;
    end
end
p5=numa5/(numa5+numb5);
