clc, clear variables 
f = @(x) exp(x)./(1+2*x.^3);
a = 0;
b = 3;
plot(1:0.1:3, f(1:0.1:3))

%% calculate
tt = [];
for i=1:10
    i = 2^i;
    h = (b-a)/i;
    x = a:h:b;
    fx = f(x);
    t = h*(fx(1)/2 + sum(fx(2:end-1)) + fx(end)/2);
    tt = [tt, t];
end

errors = diff(tt)
plot(diff(tt(2:end))./diff(tt(1:end-1)))

%% kontroll med quad
quad("exp(x)./(1+2*x.^3)", 0, 3, 0.5e-5)





