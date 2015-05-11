%% 12.1
close all;
clear all;
clc;
%Konstanter
fs = 10000;
f1 = 300;
f2 = 2000;

%Skapa en ljudsignal
n = 0:1:20000;
t = (1/fs).*n;
x = sin(2*pi*f1.*t) + sin(2*pi*f2.*n);

%Rita graf och spela upp x[n]
subplot(2,1,1); plot(t(1:500), x(1:500)); grid
soundsc(x,fs);


%Filtrera x[n]
for n = 5:1:20000
    y(n) = (x(n) + x(n-1) + x(n-2) + x(n-3) + x(n-4))/5;
end

%Rita graf och spela upp y[n]
subplot(2,1,2); plot(t(1:500), y(1:500)); grid;
soundsc(y,fs);

% Högra antal termer ger "kraftigare" filtrering men också en större
% fördröjning i början innan utsignalen svängt in sig. 

%% 12.2
close all;
clear all;
clc;
% H(z) = Y(z)/ X(z) = (z^4 + z^3 + z^2 + z + 1) / 5;

num = [ 1 1 1 1 1];
den = [5];

freqz(num, den);

% b)


%% 12.3
close all;
clear all;
clc;

fs = 11025;
fb = 2500;

% O = 2pi*2500/11025 = 0.45*pi rad/s
O = 2*(fb/fs);

B = fir1(100, O);
freqz(B,1);

W = hanning(101);
C = B.*W';
figure(2); freqz(C,1);

% c) Ingen märkbar skillnad efter hanningfönsterhanteringen...

% d) 50 = 20*log(x) <=> x = 10^(50/20) ~ 316. Svar: 316 ggr

%% 12.5
close all;
clear all;
clc;

fs = 11025;
fb = 500;

%Beräkna normaliserad frekv.
omega = 2*fb/fs;

%Beräkna filterkoefficienter!
koeff = fir1(100,omega);

%Insignalen:
t = 0:(1/fs):2;
x = sin(2*pi*440*t) + sin(2*pi*600*t);

%soundsc(x,fs);
%FILTRERING!
y = conv(x,koeff);
%soundsc(y,fs);

%Rita graferna
subplot(211); plot(t(1:400), x(1:400)); grid;
subplot(212); plot(t(1:400), y(1:400)); grid;

%% 12.8
close all;
clear all;
clc;

[x,fs]=wavread('Trubadur');

% Korta av ljudfilen till 5 sekunder musik
x = x(1:(5*fs));
% Lyssna på den ostörda ljudfilen
%soundsc(x,fs);


W=2*800/fs;
%Det här är fan ganska godtyckligt. Men lyckades filtrera bort pipfan
num=fir1(11025,[W-0.075 W+0.01],'stop');
x2=filter(num,1,x);

%soundsc(x2,fs);
freqz(num,1);

soundsc(x2,fs);