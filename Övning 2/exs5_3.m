x = [1; 2; 4; 5];
p = [3; 3; 0; 11];

plot(x, p, "*")
hold on

% p = a*x^3 + b*x^2 + c*x + d

A = [x.^3, x.^2, x, ones(4,1)];
k = A\p;

P = @(X) k(1)*X.^3 + k(2)*X.^2 + k(3)*X + k(4);
X = x(1):0.1:x(end);

plot(X, P(X))
hold off

%% 

x = [1; 2; 4; 5; 7];
p = [3; 3; 0; 11; 6];

plot(x, p, "*")
hold on

% p = a*x^3 + b*x^2 + c*x + d

A = [x.^4, x.^3, x.^2, x, ones(5,1)];
k = A\p;

P = @(X) k(1)*X.^4 + k(2)*X.^3 + k(3)*X.^2 + k(4)*X + k(5);
X = x(1):0.1:x(end);

plot(X, P(X))
hold off
