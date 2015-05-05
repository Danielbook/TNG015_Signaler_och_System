clear all; clc; close all

w = 0:0.001:10;

H = 3./(4+j.*w);

plot(w, abs(H)); grid; 