% RVP:  y'' - x*y' + y = 0

clc, clear variables
a = 1;
b = 2;

n = 100;
h = (b-a)/n;

x = (a+h):h:(b-h); % vill bara ha inre punkter (exkludera x0 och xn)

A = 1/h^2 + x./(2*h);
B = (1-2/(h^2))*ones(length(x), 1);
C = 1/h^2 - x./(2*h);

A_matris = diag(B) + diag(A(2:end), -1) + diag(C(1:end-1), 1);

b = zeros(length(x),1);
b(end) = - C(end);

% A*y = b --> y = A\b

y = A_matris\b

plot([1; x'; 2], [0; y; 1])


