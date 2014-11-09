clear all
clc

t = 24;
n = 59;
h = n*t;
data = xlsread('Trieu2thang.xlsx')';
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

% b = ifft(h*a)
% Chua hien thuc phep nen (hien tia dang giu nguyen tan so)
% %freq => cfreq
% cfreq = freq;
% %ampt => campt
% campt = ampt; 
% %phase => cphase
% cphase = phase -pi/28;
% %plot (b,'r')


f = zeros(h,1);
for j = 1:h
    f(j) = ampt(1)/2;
    for i = 2:h/2
        f(j) = f(j) + ampt(i)*cos( 2*pi*freq(i)*(j-1)*3600 + phase(i) );
    end
    Bias(j)= abs(data(j) - f(j))/data(j)*100;
end
plot(f,'r')
B = sum(Bias)/h
%hold off