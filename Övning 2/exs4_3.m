clc, clear variables
t = [0;1;3;4];
y = [1;8;11;20];

% plotta mätvärden
plot(t,y)
hold on

%% plotta linjär modell
x = 0:0.1:4;
A = [ones(4,1), t];
c = (A'*A)^-1*A'*y;

f = @(x) c(1)+c(2)*x;
fx = f(x);
plot(x, fx)

%% plotta horisontell modell
A = ones(4,1);
%c = (A'*A)^-1*A'*y
c = A\y
fx = c*x./x;
plot(x, fx)

%% plotta modell med m = 0
A = [t]
c = (A'*A)^-1*A'*y
f = @(x) c*x;
fx = f(x);
plot(x, fx)
hold off