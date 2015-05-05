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


%% 6abc

[x, fs] = wavread('BUZZE1');

fs1 = round(fs*0.3);

h = zeros(fs1, 1);
h(1) = 1;
h(fs1/2) = 1;
h(fs1) = 1;

y = conv(x, h);

soundsc(y, fs);

%% 7
clear all; clc;

% sjukt star wars
load('piano1.mat')
fs = fs*0.5;
soundsc(y1,fs);
pause(0.5)
soundsc(y1,fs);
pause(0.5)
soundsc(y1,fs);
pause(0.5)
soundsc(y1,fs*0.85);
pause(0.25)
soundsc(y1,fs*1.15);
pause(0.3)
soundsc(y1,fs);
pause(0.5)
soundsc(y1,fs*0.85);
pause(0.25)
soundsc(y1,fs*1.15);
pause(0.3)
soundsc(y1,fs);
pause(1)
soundsc(y1,fs*1.55);
pause(0.5)
soundsc(y1,fs*1.55);
pause(0.5)
soundsc(y1,fs*1.55);
pause(0.5)

%% 8a
clear all; clc;
load('piano1.mat')


X = fft(y1);
N = length(X);
f = 0:fs/N:fs/2;
X_magn=abs(X)/(N/2);

plot(f,X_magn(1:length(f)));
grid;


%% 15
clear all; clc;
load('phonenumber.mat')


