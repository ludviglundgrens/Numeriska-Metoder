
%%
f = @(x) 10*x.^0.1-x-cos(x)-exp(-x)

x = -1:0.1:13;
fx = f(x);

plot(x, fx)
hold on
plot(x,x*0)
hold off

%% stora roten
fp = @(x) x^-0.9 - 1 + sin(x) + exp(-x);

x_n = 10;
tol = 10e-8;
error = 1;
counter = 1

while abs(error) > tol & counter < 50
    fx = f(x_n);
    fpx = fp(x_n);
    x_np1 = x_n - fx/fpx;
    
    error = x_np1 - x_n;
    
    x_n = x_np1
    
    counter = counter + 1
end

%% stora roten
fp = @(x) x^-0.9 - 1 + sin(x) + exp(-x);

x_n = 10;
tol = 10e-8;
error = 1;
counter = 1

%% lilla

x_n = 10e-7;

fx = f(x_n);
fpx = fp(x_n);
x_np1 = x_n - fx/fpx

error = x_np1 - x_n;

