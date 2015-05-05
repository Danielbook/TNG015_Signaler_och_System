%% 5.15 Filnamn Msos5_15
close all;
T=4;
a=2;
i=0;

%Välj ett lämpligt intervall för tiden t
for t1=0:0.01:10
    i=i+1;
    t(i)=t1;    %spara tiden i vektorn t
    x1=0;       %Nollställ summeringen
    
   %välje ett lämpligt intervall för k, stegintervall 1
   for k = -50:1:50
       if k == 0
           c0=0.25;
       else ck=(-1/(j*k*2*pi))*(exp(-j*k*2*pi*a/T)-1);
           x1=x1 + ck*exp(j*k*2*pi*t1/T);
       end
   end
   x(i)=c0+x1;
end
%Rita ut Fourierserien
figure;
plot(t,abs(x));
grid;

% (a) Det funkar ju men resultatet blir väldigt onajs
% (b) Ja, most def.

%% 5.16 
close all;

i=1;
for t1=0:0.01:6
    x1=0;     
   for k = -10:1:10
       if k == 0
           c0=1;
       else 
           x1=x1 + ((1.0/(j*k*pi))*(exp(j*k*pi*t1)));
       end
   end
   x(i)=c0+x1;
   t2(i)=t1;
   i=i+1;
end
plot(t2,abs(x));
grid;

%Den är ju inte 100% lik men close enough. Det går väl inte att få helt
%rätt i praktiken?

%% 5.17 

A = 1; f_signal=100; f_sample =1000;

t=0:(1/f_sample):5;

N=size(t,2);

x = A*sin(2*pi*f_signal.*t);

X=fft(x);

f=0:(f_sample/N):f_sample/2;

M=size(f,2);

plot(f,abs(X(1:M))/2501);

%% 5.18
close all;
[x,fs]=wavread('BuzzE1');

A = 1; 
f_signal=fs/2; 
f_sample=fs;

% soundsc(x,fs); 
%soundsc(X,fs); 


t=0:(1/f_sample):5;

N=size(t,2);

X=fft(x);

f=0:(f_sample/N):f_sample/2;

M=size(f,2);
plot(f,abs(X(1:M)));

soundsc(x,fs/3);

%% 5.19

fs=5000;

t=0:(1/fs):3;
x=sin(2*pi*400.*t);

X=fft(x);
N=length(X);

f=0:(fs/N):fs;

plot(f(1:N),abs(X(1:N))); grid;
