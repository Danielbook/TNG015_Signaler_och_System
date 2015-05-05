
i = 1;
for t= 0:0.01:6
    x1=0;
    for k=-100:1:100
        if k==0
            c0=1;
        else
            x1 = x1 + (1.0/(j*k*pi))*exp(j*k*pi*t);
        end
    end
    x(i) =c0+x1;
    t2(i)=t;
    i=i+1;
end
plot(t2,abs(x)); grid;