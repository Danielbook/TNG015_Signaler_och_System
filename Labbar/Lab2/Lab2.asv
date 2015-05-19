%% 3 
clear all; clc;

num = [0 1/4 1];
den = [1 2 1];

bode(num, den);

%% 4
clear all; clc;

num = [0 1/4 1];
den = [1 2 1];

bode(num, den); grid;

%% 7b
clear all; clc;

syms y(t);
dsolve(diff(y) + 4*y == 0.5*exp(-t), y(0) == 0)

fs = 10;

t = 0:1/fs:5;

y = (1/6)*(exp(-t) - exp(-4*t));

plot(t,y);

%% 8
clear all; clc;

x = ones(1, 50);
x(1) = 0;   %motsvarar x[-1] = 0
y(1) = 0;

for n=2:1:50
    y(n) = 0.05*x(n-1) + 0.6*y(n-1);   
end

figure;
stem(y, 'filled');

%% 11a
clear all; clc;

syms s;

Y=( 0.5/(s+4) )*( 1/(s+1) );

y=ilaplace(Y);

%b
for n =1:1:50
    t=0.1*n;
    y_numerisk(n)=eval(y);
    t2(n)=t;
end
plot(t2,y_numerisk);