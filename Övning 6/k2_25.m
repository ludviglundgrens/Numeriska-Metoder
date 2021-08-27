clc, clear variables

f1 = @(x) 15*x(1) + x(2)^2 - x(3) - 30;
f2 = @(x) -x(1) + 30*x(2) - x(3)^2 - 30;
f3 = @(x) -x(1)^2 + x(2) + 100*x(3) - 20;

J = @(x) [15, 2*x(2), -1;
          -1, 30, -2*x(3);
          -2*x(1), 1, 100];

x0 = [1; 1; 1];

FF = [];
for i = 1:5
    F = [f1(x0); f2(x0); f3(x0)]
    dx = J(x0)\F;
    x1 = x0 - dx;
    
    x0 = x1;
    
    err = norm(F, inf);
    
    FF = [FF; F']
end