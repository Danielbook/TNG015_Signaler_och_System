
A = 1.0;
f_signal = 100;
f_sampel = 1000;

t = 0:(1/f_sampel):5; % Skapa en tidvektor t, sampl.frekv. = 1000 Hz

% Hur många sampel blir det?
N = size(t,2);

% Skapa signalen x(t)
x = A*sin(2*pi*f_signal.*t);

% Fouriertransformera via FFT (den diskreta varianten)
X = fft(x);

% Skapa en frekvensaxel med korrekt delning(steg)
f = 0:(f_sampel/N):f_sampel/2;

% Hur många frekvenssteg blir det?
M = size(f,2);

% Rita ut resultatet
plot(f,abs(X(1:M))/2501);