clear;
clc;

[x, fs] = wavread('BuzzE1');

% soundsc(x, fs);
f_signal = fs/2;
f_sampel = fs;

t = 0:(1/f_sampel):5; % Skapa en tidvektor t, sampl.frekv. = 100000 Hz

% Hur många sampel blir det?
N = size(t,2);

% Fouriertransformera via FFT (den diskreta varianten)
X = fft(x);

% Skapa en frekvensaxel med korrekt delning(steg)
f = 0:(fs/N):fs/2;

% Hur många frekvenssteg blir det?
M = size(f,2);

% Rita ut resultatet
plot(f,abs(X(1:M))/2501);

soundsc(x, fs);