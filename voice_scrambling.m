clc
clear ;
close all;

[x ,fs] = audioread('titanic.wav');
h = matfile('filter.mat');
hh = h.filter;
y0 = filter(hh,1,x');
l = length(y0);
n = 0:l-1;
f0 = 10000;
s = 2*cos(2*pi*(f0/fs)*n);
y1 = s.*y0;
y2 = filter(hh,1,y1);
% sound(y2,fs)
%% reconstruction
q = y2.*s;
rx = filter(hh,1,q);
sound(rx,fs)