clear all
clc

%K1 = 23.9;
O1 = 25.8;
M2 = 12.4;
%S2 = 12;
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
plot(data)
A = zeros(h,4);
B = zeros(h,1);
dt = 1;
for i = 1:h/2
   A(i,1) = sin(2*pi*i*dt/O1);
   A(i,2) = cos(2*pi*i*dt/O1);
   A(i,3) = sin(2*pi*i*dt/M2);
   A(i,4) = cos(2*pi*i*dt/M2);
   %A(i,5) = cos(2*pi*i*dt/K1);
   %A(i,6) = cos(2*pi*i*dt/O1);
  % A(i,7) = cos(2*pi*i*dt/M2);
   %A(i,8) = cos(2*pi*i*dt/S2);
   B(i,1) = data(i);
end

% X = [a1;a2;a3;a4;b1;b2;b3;b4]


% X = zeros(8,1);
X = (A'*A)\(A'*B);

f = zeros(h,1);
Bias = zeros(h/2,1);
for i = 1:h
    %f(i) = mean(data) + X(1)*sin(2*pi*i*dt/K1)+X(2)*sin(2*pi*i*dt/O1)+X(3)*sin(2*pi*i*dt/M2)+X(4)*sin(2*pi*i*dt/S2)+X(5)*cos(2*pi*i*dt/K1)+X(6)*cos(2*pi*i*dt/O1)+X(7)*cos(2*pi*i*dt/M2)+X(8)*cos(2*pi*i*dt/S2);
    f(i) = mean(data) + X(1)*sin(2*pi*i*dt/O1)+X(2)*cos(2*pi*i*dt/O1)+X(3)*sin(2*pi*i*dt/M2)+X(4)*cos(2*pi*i*dt/M2);
    if i >= h/2
    Bias(i)= abs(data(i) - f(i))/data(i)*100;    
    end
end
hold on
plot (f,'r')
mean(Bias)
