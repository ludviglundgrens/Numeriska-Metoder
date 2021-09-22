
%% plot

f = @(x) (1/3)*(x.^2+1);
x = 0:0.1:5;

fx = f(x);
gx = x;

plot(x, fx)
hold on 
plot(x, gx)
hold off

%% hitta rot

tol = 10e-6;
error = 1;
x0 = 2;
counter = 0;

while abs(error) > tol & counter < 20
    x1 = f(x0);
    error = x1-x0
    x0 = x1;
    counter = counter+1
end
    