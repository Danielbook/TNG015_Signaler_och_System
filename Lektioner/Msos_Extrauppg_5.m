clear; clc; close all;
%% a)
f1 = 440; f2 = 600; A = 1.0; fs = 11025;
t = 0:(1/fs):2;
x = A*sin(2*pi*f1.*t) + A*sin(2*pi*f2.*t);

%% b)
figure(1);
plot(t(1:200),x(1:200)); grid;

%% c)
X = fft(x);
N = length(x);
f = 0:(fs/N):fs/2;

M = length(f);
figure();
plot( f, abs(X(1:M))/(N/2)); grid;

w1 = 2*pi*f1;
w2 = 2*pi*f2;

%% d)
num = [100];
den = [1 100];

figure();
bode(num, den); grid;

H1=abs(100/(j*w1+100));         % Beräkna skalfaktor
H2=abs(100/(j*w2+100));
fas1=angle(100/(j*w1+100));     % Beräkna fasvridning
fas2=angle(100/(j*w2+100));

y=H1*sin(2*pi*f1.*t+fas1) + H2*sin(2*pi*f2.*t+fas2); %Beräkna utsignalen

Y=fft(y);
figure(); plot(f,abs(Y(1:M))/(N/2)); grid;
figure(); plot(t(1:200),y(1:200)); grid; 