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
    tt = [tt, t]
end
error1 = diff(tt)
plot(tt)
hold on
% dominerande feltermen: E(2h)/E(h)=2^p --> feltermen c*h^p dominerar
% Lös ut p: p = ln(E(2h)/E(h))/ln(2)
% log(diff(tt(1:end-1))./diff(tt(2:end)))/log(2);

%% richardson extrapolation
tt = [];

for i=1:10
    i = 2^i;
    h = (b-a)/i;
    x = a:h:b;
    fx = f(x);
    
    th = h*(fx(1)/2 + sum(fx(2:end-1)) + fx(end)/2);
    
    h = 2*h;
    x = a:h:b;
    fx = f(x);

    t2h = h*(fx(1)/2 + sum(fx(2:end-1)) + fx(end)/2);
    
    that = th + (th-t2h)/3;
    
    tt = [tt, that]
end
error2 = diff(tt)./tt(1:end-1)
plot(tt)

%% kontroll med quad
q = quad("exp(x)./(1+2*x.^3)", 0, 3, 0.5e-5);
plot(1:10, ones(10,1)*q, "-.")
hold off
