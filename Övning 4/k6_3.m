clc, clear variables

yp = @(x, y) -y + x.^2;

n = 1000;
a = 1;
b = 1.5;
h = (b-a)/n;

% startvärden
x0 = a;
y0 = 2;

xx = [x0];
yy = [y0];

for i = 1:n
    ypp = yp(x0, y0);
    y1 = y0 + h*ypp;
    x1 = x0+h;
    
    xx = [xx, x1];
    yy = [yy, y1];
    
    x0 = x1;
    y0 = y1;
end

plot(xx, yy)

yslut = yy(end)

