clear all
clc

n = 24*31;
data = xlsread('Trieu.xls');
signal = zeros(n,1);
for j = 1:31
    for i = 1:24
        signal((j-1)*24 + i,1) = data(j,i);
    end
end
plot (signal,'g')
hold on

spec = fft(signal)/n;
freq = 1/3600*linspace(0, 1, n);
ampt = 2*abs(spec);
% plot(f(2:end),m(2:end));
phase = angle(spec);
% plot(f,phase)

% b = ifft(h*a)
% Chua hien thuc phep nen (hien tia dang giu nguyen tan so)
%freq => cfreq
cfreq = freq;
%ampt => campt
campt = ampt; 
%phase => cphase
cphase = phase -pi/28;
%plot (b,'r')


csignal = zeros(n,1);
for j = 1:n
    csignal(j) = campt(1)/2;
    for i = 2:n/2
        csignal(j) = csignal(j) + campt(i)*cos( 2*pi*cfreq(i)*(j-1)*3600 + cphase(i) );
    end
    Bias(j)= abs(signal(j) - csignal(j))/signal(j)*100;
end
plot(csignal,'r')
mean(Bias)
%hold off