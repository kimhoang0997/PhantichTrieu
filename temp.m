clear all
clc
load data1trieu.mat data;
plot(data)
spec = fft(data);
plot(spec)