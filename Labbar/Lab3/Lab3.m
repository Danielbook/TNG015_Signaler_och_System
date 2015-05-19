%% 1a
clear all; clc; close all;
colormap('gray');
for r=1:512
    for c=1:512
        B1(r,c)=uint8(128-127*sin(2*pi*3*c/512));
        B2(r,c)=uint8(128-127*sin(2*pi*45*c/512)); 
    end
end

%Rita bilderna:
imshow(B1), figure(2), imshow(B2);

%Skapa ett LP-filter av medelvärdestyp: 
h_lowp=(1/100)*ones(10,10);

% 2

B1_lowp=uint8(conv2(single(h_lowp),single(B1)));
B2_lowp=uint8(conv2(single(h_lowp),single(B2)));

figure(3); imshow(B1_lowp); figure(4); imshow(B2_lowp);

% 3
h_highp=[1 0 -1;2 0 -2; 1 0 -1];

B1_highp=uint8(conv2(single(h_highp),single(B1)));
B2_highp=uint8(conv2(single(h_highp),single(B2)));

figure(5); imshow(B1_highp); figure(6); imshow(B2_highp);

%% 4a
clear all; clc; close all;

Bird = imread('Bird_lab3.JPG');

imshow(Bird);

%% 4b
close all;
Bird_black = rgb2gray(Bird);

horz=[1 2 1;0 0 0; -1 -2 -1]
vert=[1 0 -1;2 0 -2; 1 0 -1]

Bird_horz=uint8(conv2(single(horz),single(Bird_black)));
Bird_vert=uint8(conv2(single(vert),single(Bird_black)));

figure(1); imshow(Bird_horz);
figure(2); imshow(Bird_vert);


%% 5
clear all; clc; close all; 
t = 0:0.001:2;
x_storn=sin(2*pi*50.*t);
x_storn2=0.6*sin(2*pi*50.*t+pi/7);
x_signal=sin(2*pi*30.*t);
x_bland=x_storn+x_signal;

P=con2seq(x_storn2);
T=con2seq(x_bland);
pr=[-1,1];
s=1;
id=[0 1 2 3 4 5 6 7 8 9 10];
lr=0.01;
net=newlin(pr,s,id,lr);
net.adaptParam.passes=30;
Pi={ 0 0 0 0 0 0 0 0 0 0 };
[net,y,e,Pf,Af,tr]=adapt(net,P,T,Pi);

plot(t(1:500),x_signal(1:500))

figure;
plot(t(1:500),x_bland(1:500))

figure;
plot(t(1:500),[e{1:500}])

%% 6
clear all; clc; close all; 
t = 0:0.001:2;
x_storn=sin(2*pi*50.*t);
x_storn2=0.6*sin(2*pi*50.*t+pi/7);
x_signal=sin(2*pi*30.*t);
x_bland=x_storn+x_signal;

P=con2seq(x_storn2);
T=con2seq(x_bland);
pr=[-1,1];
s=1;
id=[0 1 2 3 4 5 6 7 8 9 10];
lr=0.08;
net=newlin(pr,s,id,lr);
net.adaptParam.passes=30;
Pi={ 0 0 0 0 0 0 0 0 0 0 };
[net,y,e,Pf,Af,tr]=adapt(net,P,T,Pi);

plot(t(1:500),x_signal(1:500))

figure;
plot(t(1:500),x_bland(1:500))

figure;
plot(t(1:500),[e{1:500}])
