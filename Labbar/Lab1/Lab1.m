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
clear all; clc; close all;
load('phonenumber.mat')

y1 = y(1:1000);
y2 = y(1200:2200);
y3 = y(2400:3400);
y4 = y(3600:4600);
y5 = y(4800:5800);
y6 = y(6000:7000);
y7 = y(7200:8200);

Y1 = fft(y1);
Y2 = fft(y2);
Y3 = fft(y3);
Y4 = fft(y4);
Y5 = fft(y5);
Y6 = fft(y6);
Y7 = fft(y7);

f1 = 0: fs/length(Y1):fs/2;
figure;
plot( f1(1:350), abs( Y1(1:350) ) );

f2 = 0: fs/length(Y2):fs/2;
figure;
plot( f2(1:350), abs( Y2(1:350) ) );

f3 = 0: fs/length(Y3):fs/2;
figure;
plot( f3(1:350), abs( Y3(1:350) ) );

f4 = 0: fs/length(Y4):fs/2;
figure;
plot( f4(1:350), abs( Y4(1:350) ) );

f5 = 0: fs/length(Y5):fs/2;
figure;
plot( f5(1:350), abs( Y5(1:350) ) );

f6 = 0: fs/length(Y6):fs/2;
figure;
plot( f6(1:350), abs( Y6(1:350) ) );

f7 = 0: fs/length(Y7):fs/2;
figure;
plot( f7(1:350), abs( Y7(1:350) ) );

%% 10
%a
clear all; clc; close all;
load('balk.mat')

f = linspace( 0, 400, 1024 );

Y11 = fft(y11);
Y12 = fft(y12);
Y21 = fft(y21);
Y22 = fft(y22);
Y31 = fft(y31);
Y32 = fft(y32);

figure;
plot( f(1:500), abs( Y11(1:500) ) );

figure;
plot( f(1:500), abs( Y12(1:500) ) );

figure;
plot( f(1:500), abs( Y21(1:500) ) );

figure;
plot( f(1:500), abs( Y22(1:500) ) );

figure;
plot( f(1:500), abs( Y31(1:500) ) );

figure;
plot( f(1:500), abs( Y32(1:500) ) );
