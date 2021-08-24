clc, clear variables
x = [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]';
y = [2.60 2.08 1.72 1.45 1.26 1.13 1.04 0.97 0.92]';


% Beräkna area med trapetsregeln för två olika steglängder
h = x(2)-x(1);
area = h*(y(1)/2 + sum(y(2:1:end-1)) + y(end)/2)

h = x(3)-x(1);
area2 = h*(y(1)/2 + sum(y(3:2:end-2)) + y(end)/2)

error = abs(area-area2)

%% Beräkning med loop
a = []
f = @(steg, x, y) (x(1+steg)-x(1))*(y(1)/2 + sum(y(steg+1:steg:end-steg)) + y(end)/2);

for steg=1:2
    area = f(steg, x, y)
    a = [a, area];
end

error = diff(a)