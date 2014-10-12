clear all
clc
load data1trieu.mat data;
plot(data)
ftdata = fft(data)/length(data);

[peak loc] = findpeaks(ftdata);
index = 1;
for i = 1:length(ftdata)
    if index < length(loc) && loc(index) == i && 2*abs(peak(index)) >= 0
        ftdata(i) = peak(index);
        index  = index + 1;
    else
        ftdata(i) = 0;
    end
end
% t=[];
% for j = 1:length(loc)
%     t = loc(j);
%     for i = 1:744
%       if i == t
%          ftdata(i) = peak(j);
%       else
%          ftdata(i) = 0;
%       end
%     end
% end

% da = ftdata
% for i = 1: length(ftdata)
%     if  i ~= index,peak <= 1)
%         ftdata(i) = 0;
%     end
% end
ivdata = abs(ifft(ftdata*length(data)));  
hold on
plot(ivdata,'r')
Bias = zeros(length(data),1);
for i = 1:length(data)
    Bias(i) = abs(data(i) - ivdata(i))/data(i)*100;
end
mean(Bias)

    