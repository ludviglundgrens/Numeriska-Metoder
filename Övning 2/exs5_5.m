clc, clear variables

x = [1; 16; 31];
y = [20+56/60; 22+24/60; 22+1/60];
A = [x.^2, x, ones(3,1)];

c = A\y;
f = @(x) c(1)*x.^2 + c(2)*x + c(3);

x = 0:0.1:30;
fx = f(x);

plot(x, fx)

%%
clc

err = 1;
tol = 10e-6;
step = 1;
count = 1;
f_max_last = 0;

while abs(err)>tol | count > 10
    x = 0:step:30;
    fx = f(x);
    
    % ta fram maxvärdet i listan
    f_max = max(fx)
    
    err = f_max-f_max_last
    
    f_max_last = f_max;
    
    step = step/10;
    count = count+1
end

