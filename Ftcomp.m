clear all
clc

t = 24;
n = 31;
h = n*t;
data = xlsread('Trieu.xls')';
temp = zeros(h,1);
k = 1;
for j = 1:n
    for i = 1:t 
        temp(k) = data(i,j);
        k = k + 1;
    end
end
data = temp;
clear temp;
plot (data,'g')
hold on

spec = fft(data)/h;
freq = 1/3600*linspace(0, 1, h);
ampt = 2*abs(spec);
% plot(f(2:end),m(2:end));
phase = angle(spec) - pi/28;
% plot(f,phase)

% Nen
% campt = ampt;
% cfreq = freq;
% cphase = phase;
[peak, index] = findpeaks(ampt);
k = 1;
for i = 1:length(index)
   if peak(i) >= 20
       campt(k) = peak(i);
       jndex(k) = index(i);
       cfreq(k) = freq(jndex(k))*3600;
       cspec(k) = spec(jndex(k));
       cphase(k) = angle(spec(jndex(k)));
       k = k+1;
   end
end

f = zeros(h,1);
Bias = zeros(h,1);
for j = 1:h
    f(j) = mean(data);
    for i = 1:length(campt)/2
        f(j) = f(j) + campt(i)*cos(2*pi*cfreq(i)*(j-1)+cphase(i));
    end
    Bias(j)= abs(data(j) - f(j))/data(j)*100;
end
plot(f,'r')
mean(Bias)

length(cfreq)
for i = 1:4
    fr(i) = 1/cfreq(i)
end
