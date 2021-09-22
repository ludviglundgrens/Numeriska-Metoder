clc, clear variables

n = 1000;
f = @(k,n) I(k,n)-k;
x0 = 1; x1 = 2;

err = 1; tol = 1e-5;
iter = 1;
while abs(err)>tol && iter < 100
   k = (f(x1,n)-f(x0,n))/(x1-x0);
   dx = f(x1,n)/k;
   x2 = x1-dx;
   
   x0 = x1; x1 = x2;
   err = (x1-x0);
   iter = iter +1;
end

function svar = I(k,n)
    a = -1; b = 1;
    h = (b-a)/n;
    x = a:h:b;
    y = cos(pi.*x)./(x.^2+k^2);
    svar = h*(sum(y)-(y(1)+y(end))/2);
end