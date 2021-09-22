%% Interpolation med polyfit
x = [1, 2, 3, 4];
y = [10, 100, 1000, 10];
p = polyfit(x, y, 3)
val = polyval(p, 10)

% Får användas på tentan: \, sum(), max()
% Får ej använda: fzero(), polyfit()


%% Styckvis interpolation
p1 = interp1(x, y, 1:0.01:4);
plot(1:0.01:4, p1)

%% Hantering av datum
date1 = datenum("2021-01-01")-datenum("2021-01-01")
date2 = datenum("2021-03-01")-datenum("2021-01-01") 

%% Exs 6.1
clc, clear variables
x = [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]';
y = [2.60 2.08 1.72 1.45 1.26 1.13 1.04 0.97 0.92]';

%plot(x, y)

a = x(1);
b = x(end);
h = x(2)-x(1);

Th = h*( sum(y(2:1:end-1)) + (y(1)+y(end))/2 );

% Trunkeringsfelet: e = abs(T(2h) - T(h))

h = x(3)-x(1);
T2h = h*( sum(y(3:2:end-2)) + (y(1)+y(end))/2 );

% Bästa skattning och trunkeringsfel
int = Th
int_fel = abs(T2h - Th)

%% Exs 6.2
clc, clear variables

f = @(x) exp(x)./(1+2*x.^3);
a = 0;
b = 3;
n = 10;
h = (b-a)/n;

Th = h*( sum( f((a+h):h:(b-h))) + ( f(a) + f(b) )/2 )

%% Trunkeringsfelet < 1e-4
clc, clear variables
format long

f = @(x) exp(x)./(1+2*x.^3);
a = 0;
b = 3;
tol = 1e-4;

err = 1;
Th_old = 10;
n = 2;
iter = 1;

while abs(err) > tol && iter < 10
    h = (b-a)/n;

    Th = h*( sum( f((a+h):h:(b-h))) + ( f(a) + f(b) )/2 );
    
    % Jämför nya Th med förra Th (alltså T2h)
    err = Th_old - Th
    
    %spara Th till nästa varv
    Th_old = Th;
    
    % öka n och iter varje varv
    n = 2*n
    iter = iter + 1;
end

%% K 5.6
X=[0:0.05:0.8 2 3 5:0.1:5.3 6 8];
Y=[3 4 2.2 2.9 2.1 2.7 2.2 2.6 2.15 2.5 2.16 2.4 2.17 ...
2.3 2.18 2.28 2.23 2.2 2.24 2.5 4.9 0.1 0.4 0.35 0.3];
xx=0:0.01:8; 
plot(xx,pchip(X,Y,xx))





