p = [10, 16, 25, 40, 60]';
q = [94, 118, 147, 180, 230]';

% flödet är proportionellt mot en obekant potens av trycket
% q = c1*p^c2
% ln(q) = ln(c1) + c2*ln(p)

A = [ones(5,1), log(p)];
c = A\log(q)
c(1) = exp(c(1))

%%
plot(p, q, "o")
hold on

plot(p, c(1)*p.^c(2))
hold off