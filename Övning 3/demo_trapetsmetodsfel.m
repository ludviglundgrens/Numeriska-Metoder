f = @(x) 25-(x).^2;

x = 0:0.01:5;
fx = f(x);

plot(x, fx)
hold on

% ett steg
x2 = 0:5:5;
fx2 = f(x2);
plot(x2, fx2)

% två steg
x3 = 0:5/2:5;
fx3 = f(x3);
plot(x3, fx3)

% fyra steg
x4 = 0:5/4:5;
fx4 = f(x4);
plot(x4, fx4)
hold off

%% plotta felet
error1 = fx-interp1(x3, fx3, x);
plot(x, error1)
hold on

error2 = fx-interp1(x2, fx2, x);
plot(x, error2)

error3 = fx-interp1(x4, fx4, x);
plot(x, error3)

hold off