% a)
f = @(x) 30./(1 + x.^4 + sqrt(1 + x.^3));

tol = 10^-6;
err = 1;
n = 1;
a = 0;
b = 1;
count = 1;

tt = [0];
while abs(err) > tol & count < 10
    % steglängd h
    h = (b-a)/n;
    x = a:h:b;
    y = f(x);
    th = h*(y(1)/2 + sum(y(2:end-1)) + y(end)/2);
    
    % steglängd 2h
    h = 2*h
    x = a:h:b;
    y = f(x);
    t2h = h*(y(1)/2 + sum(y(2:end-1)) + y(end)/2);
    
    
    % Richardson extrapolation
    t = th + (th-t2h)/3;
    
    % spara värde
    tt = [tt, t];
    
    % trunkeringsfel
    err = tt(end)-tt(end-1)
    n = n*2;
    count = count + 1;
end

