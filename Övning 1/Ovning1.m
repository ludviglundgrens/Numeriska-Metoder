% Övning 1 - Ludvig

%% Matlab intro
clc, clear variables

% 1A
v1 = [4, 7];

% 1B
v2 = [3; 8];

A = [4, 7; 3, 8];
% or A = [v1; v2']

% 2A
v3 = 4:9;

% 2B 
v4 = 2:0.1:3;

% 3A
x = 0:0.1:3;
fx = x+cos(x);
% plot(x, fx)

% 3B 
fx = x.^2+cos(x);
% plot(x, fx)

% Samma problem kan lösas genom att skapa en funktion 
f = @(x) x.^2+cos(x)
%plot(x, f(x))

%% K 3.1
clc, clear variables

f1 = @(x) x.^3 - 0.01
f2 = @(x) sin(4*x)

x = -2:0.1:2;
f1x = f1(x)
f2x = f2(x)

%plot(x, f1x)
%hold on 
%plot(x, f2x)
%hold off

f = @(x) x.^3 -sin(4*x) - 0.01;
plot(x, f(x))
hold on 
yline(0)
hold off

%% A2
clc, clear variables
f = @(x) x.^3 - 2;
fp = @(x) 3*x.^2;

x0 = 2;
dx = f(x0) / fp(x0) 

% Newton-Rhapson: x1 = x0 - f/fp
x1 = x0 - dx 

% x2 = x1 - f/fp
dx = f(x1) / fp(x1) 
x2 = x1 - dx

% x3 = x2 - f/fp
dx = f(x2) / fp(x2) 
x3 = x2 - dx

% Plot 
%x = 0:0.1:3;
%plot(x, f(x))

xx = [x0, x1, x2, x3]
error = abs(diff(xx))

%% K 3.4
clc, clear variables
f = @(x) x.^6 + 2*x^4 - 2*x^2 - 10^6

a = 9;  % f(a) < 0
b = 10; % f(b) > 0

ee = []
for i=1:10
    m = (b+a)/2
    if f(m) > 0    % f(m) > 0 --> b = m
        b = m;
    else           % f(m) < 0 --> a = m
        a = m;
    end
    error = abs(b-a);
    ee = [ee, error];
end     

% använd format long för att se små fel
svar = [a,b]
error = abs(b-a)





























