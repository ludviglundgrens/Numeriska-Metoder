a = 0;
b = 10;

f = @(x) 25-(x).^2;

x = a:0.01:b;
fx = f(x);

plot(x, fx)
hold on

% ett steg
x2 = a:5:b;
fx2 = f(x2);
plot(x2, fx2)

% två steg
x3 = a:5/2:b;
fx3 = f(x3);
plot(x3, fx3)

% fyra steg
x4 = a:5/4:b;
fx4 = f(x4);
plot(x4, fx4)
hold off

%% plotta felet
error1 = fx-interp1(x2, fx2, x);
plot(x, error1)
hold on

error2 = fx-interp1(x3, fx3, x);
plot(x, error2)

error3 = fx-interp1(x4, fx4, x);
plot(x, error3)

hold off
