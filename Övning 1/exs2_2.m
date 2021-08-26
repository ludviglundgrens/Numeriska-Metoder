x = 0:0.01:2
f = 1+x+x.^2/2
g = 10-10*x.^2/2

f2 = exp(x);
g2 = 10*cos(x);

plot(x, f)
hold on
plot(x, g)
plot(x, f2, "--")
plot(x, g2, "--")
hold off
