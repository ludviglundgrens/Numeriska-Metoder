%% Orginalekvation
clc, clear variables

format long
f1 = @(x) (1-exp( -(x./3).^3 ))./(3*x.^3)

x = 0.1:0.00001:10;
plot(x, f1(x))
int1 = quad(f1, 0.001, 10000000)

%% Efter substitution
x = 0:0.01:10;
f2 = @(t) (1-exp(-(1./(3*sqrt(t))).^3))./6

int2 = quad(f2, 0, 1000000)

x = 0:0.01:10;
plot(x, f2(x))

err = abs(int1-int2)

% när t = 0 --> f2 = (1 - e^(-oändl))/6 = 1/6
f0 = f2(0)