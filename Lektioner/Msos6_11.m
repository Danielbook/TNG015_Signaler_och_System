
w1 = -12:0.1:-4;
w2 = 4:0.1:12;
H1 = exp(-abs(6-abs(w1))).*exp(-j*3*w1);
H2 = exp(-abs(6-abs(w2))).*exp(-j*3*w2);





subplot(211); plot(w1, abs(H1));
subplot(212); plot(w1, angle(H1)*180/pi);

subplot(211); hold on; plot(w2, abs(H2)); grid; 
subplot(212); hold on; plot(w2, angle(H2)*360/(2*pi)); grid;

% b) Det är ett LP-filter, släpper igenom låga frekv.

