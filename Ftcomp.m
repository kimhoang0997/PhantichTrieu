clear all
clc

day = 31;
hour = 24;
n = 24*31;
data = xlsread('Trieu.xls');
sample = zeros(n,1);
for j = 1:day
    for i = 1:hour
        sample((j-1)*24 + i,1) = data(j,i);
    end
end

signal = [];
signal = sample(1:n/2);
plot (sample,'g')
hold on

spec = fft(signal)/(n/2);
freq = 1/3600*linspace(0, 1, (n/2));
ampt = 2*abs(spec);
% plot(f(2:end),m(2:end));
phase = angle(spec);
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

% Nen

[peak index] = findpeaks(ampt);
jndex = 1;
for i = 0:length(index)
    while(jndex < index) 
        
    end
end
for i = 1:n/2
    if i == index
        campt(ind) = peak(j);
        cfreq(ind) = freq(k);
        cspec(ind) = spec(k);
        cphase(ind) = angle(cspec(ind));
        ind = ind+1;
    end
end

% Dieu kien
ind = 1
for i = 1:length (campt)
    if campt(i) >= 3
        campt(i) = campt(i);
        cfreq(i) = cfreq(i);
        cphase(i) = cphase(i);
        k = ind
        ind = ind+1
    else
        campt(i) = 0;
        cfreq(i) = 0;
        cphase(i) = 0;
    end
end

csignal = zeros(n,1);
for j = 1:n
    csignal(j) = campt(1)/2;
    for i = 2;
        csignal(j) = csignal(j) + campt(i)*cos( 2*pi*cfreq(i)*(j-1)*3600 + cphase(i) );
    end
    if j>=n/2+1
        Bias(j)= abs(sample(j) - csignal(j))/sample(j)*100;
    end
end
plot(csignal,'r')
mean(Bias)
%hold off