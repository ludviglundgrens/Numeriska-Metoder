clc, clear variables

t = [0; 2; 4; 6; 8; 10];
y = [1; 1.6; 1.4; 0.6; 0.2; 0.8];

A = [ones(6,1), sin(t*pi/6), cos(t*pi/6)];

c = A\y

h = @(t) c(1) + c(2)*sin(t*pi/6) + c(3)*cos(t*pi/6);
t_cont = t(1):0.1:t(end);
ht = h(t_cont);

plot(t,y)
hold on
plot(t_cont, ht)