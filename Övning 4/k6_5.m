clc, clear variables

w = @(w, wp, h) w + h*wp;
wp = @(x, w, wp, h) wp + h*(10 + 2*w*wp - 4*x*(w+wp)^2);

a = 3;
b = 4;
n = 50;

x0 = a;
w0 = 1;
wp0 = -1;


h = (b-a)/n;

xx = [x0];
ww = [w0];

for i=1:n
    w1 = w(w0, wp0, h);
    wp1 = wp(x0, w0, wp0, h);
    
    x1 = x0 + h;
    
    x0 = x1;
    w0 = w1;
    wp0 = wp1;
    
    xx = [xx, x0];
    ww = [ww, w0];
end

plot(xx, ww)

wslut = ww(end)