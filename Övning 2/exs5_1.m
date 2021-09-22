t = [-15; -10; -5; 0];
p = [1.24; 1.95; 3.01; 4.58];

% tryck (p) en funktion av temperatur (t)
% p = a*t+b 

A = [t(2:3), ones(2,1)]
P = p(2:3);

k = A\P;
f = @(x) k(1)*x + k(2);

t_int = t(1):0.1:t(end);
p_int = f(t_int)

plot(t, p, "*")
hold on
plot(t_int, p_int, "red")
hold off

%% Använd låga punkter, kvadratisk interpolation
A = [t(1:3).^2, t(1:3), ones(3,1)];
P = p(1:3);

k = A\P;
f = @(x) k(1)*x.^2 + k(2)*x + k(3);

p_int = f(t_int);

hold on
plot(t_int, p_int)
hold off

%% använd höga punkter

A = [t(2:4).^2, t(2:4), ones(3,1)];
P = p(2:4);

k = linsolve(A, P);
f = @(x) k(1)*x.^2 + k(2)*x + k(3);

p_int = f(t_int);

hold on
plot(t_int, p_int)
hold off

