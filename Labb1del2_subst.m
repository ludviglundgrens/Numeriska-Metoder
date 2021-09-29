%% Orginalekvation
clc, clear variables

format long
f1 = @(x) (1-exp( -(x./7).^3 ))./(3*x.^3);

x = 0.1:0.00001:10;
plot(x, f1(x))
int1 = quad(f1, 0.0001, 10^6)

% Efter substitution
x = 0:0.01:100000;
f2 = @(t) (1-exp(-(1./(7*sqrt(t))).^3))./6

int2 = quad(f2, 0, 10^6)

x = 0:0.01:10;
plot(x, f2(x))

err = abs(int1-int2)

% när t = 0 --> f2 = (1 - e^(-oändl))/6 = 1/6
f2_0 = f2(0)



%% Orginalekvation förra året
clc, clear variables

format long
f1 = @(x) (1-exp( -(x./5).^3 ))./(3*2.^3);

x = 0.1:0.00001:10;
plot(x, f1(x))
int1 = quad(f1, 0.0001, 10^6)

% Efter substitution
x = 0:0.01:10;
f2 = @(t) (1-exp(-(1./(5*sqrt(t))).^3))./4

int2 = quad(f2, 0, 10^6)

x = 0:0.01:10;
plot(x, f2(x))

err = abs(int1-int2)

% när t = 0 --> f2 = (1 - e^(-oändl))/6 = 1/6
f2_0 = f2(0)








