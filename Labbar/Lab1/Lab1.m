clear all
clc
 
%% 1a och b
%y = zeroes(1,n);
x = ones(1, 30);
x(1) = 0;   %motsvarar x[-1] = 0
h(1) = 0;


for n=2:1:30
    h(n) = 0.08*x(n-1) + 0.84*h(n-1);   
end

figure;
stem(h, 'filled');
title('Lösningen till ekvationen y(t) = 0.08*x(n-1) + 0.84*y(n-1)');

%% 3a

%y = ones(1,30);

Ts = 0.02;

t = 0:Ts:0.6;
h = (1-exp(-8.*t))/2;
figure;
plot(t,h)

%% 4a & b occch c
Ts = 0.02;
t = 0:Ts:0.6;

h = 4.*exp(-8.*t);

x = ones (1, 30);
y = conv(x, h);

plot(t(1:30),y(1:30));

%% 5a
Ts = 0.02;
t = 0:Ts:0.6;

h = 0.019.*4.*exp(-8.*t);

x = ones (1, 30);
y = conv(x, h);
figure;
plot(t(1:30),y(1:30));

Ts = 0.01;
t = 0:Ts:0.6;

h = 0.01.*4.*exp(-8.*t);

x = ones (1, 60);
y = conv(x, h);
figure;
plot(t(1:60),y(1:60));


%% 6a

[x,fs]=wavread('nocturne');