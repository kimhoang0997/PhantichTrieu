clear all
clc
load data1trieu.mat data;
plot(data)
ftdata = fft(data)/length(data);
amftdata = 2*abs(ftdata);
for i = 1: length(ftdata)
    if amftdata(i) <= 10
        ftdata(i) = 0;
    end
end
ivdata = ifft(ftdata*length(data));  
hold on
plot(ivdata,'r')
for i = 1:length(data)
    Bias(i) = (data(i) - ivdata(i))/data(i)*100;
end
mean Bias

    