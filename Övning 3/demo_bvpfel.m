a = 0;
b = 10;

f = @(x) 25-(x).^2;
x = a:0.01:b;
fx = f(x);

plot(x, fx, "-.")
hold on

fp = @(x) -2*x

% 4 steg
n = 4;
h = (b-a)/n;
x0 = a;
y0 = f(x0);
xy = [x0, y0];
for i=1:n
    y1 = y0 + h*fp(x0)
    x0 = x0 + h;
    y0 = y1;
    xy = [xy; x0, y0];
end
plot(xy(:,1), xy(:,2))
xy1 = xy


% 8 steg
n = 8;
h = (b-a)/n;
x0 = a;
y0 = f(x0);
xy = [x0, y0];
for i=1:n
    y1 = y0 + h*fp(x0)
    x0 = x0 + h;
    y0 = y1;
    xy = [xy; x0, y0];
end
plot(xy(:,1), xy(:,2))
xy2 = xy

% 16 steg
n = 16;
h = (b-a)/n;
x0 = a;
y0 = f(x0);
xy = [x0, y0];
for i=1:n
    y1 = y0 + h*fp(x0)
    x0 = x0 + h;
    y0 = y1;
    xy = [xy; x0, y0];
end
plot(xy(:,1), xy(:,2))
xy3 = xy

% 32 steg
n = 32;
h = (b-a)/n;
x0 = a;
y0 = f(x0);
xy = [x0, y0];
for i=1:n
    y1 = y0 + h*fp(x0)
    x0 = x0 + h;
    y0 = y1;
    xy = [xy; x0, y0];
end
plot(xy(:,1), xy(:,2))
hold off
xy4 = xy


%% Plotta felet

error1 = fx-interp1(xy1(:,1), xy1(:,2), x);
plot(x, error1)
hold on

error2 = fx-interp1(xy2(:,1), xy2(:,2), x);
plot(x, error2)

error3 = fx-interp1(xy3(:,1), xy3(:,2), x);
plot(x, error3)

error4 = fx-interp1(xy4(:,1), xy4(:,2), x);
plot(x, error4)
hold off




