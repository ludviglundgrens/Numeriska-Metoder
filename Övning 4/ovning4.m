%% K 6.3
clc, clear variables
yp = @(x, y) -y + x.^2;

x0 = 1;
y0 = 2;

a = x0;
b = 1.5;
n = 8;
h = (b-a)/n;

xx = [x0];
yy = [y0];
for i = 1:n
    y1 = y0 + h*yp(x0, y0);
    x1 = x0 + h;
    
    y0 = y1;
    x0 = x1;
    
    xx = [xx, x0];
    yy = [yy, y0];
end
y_slut = yy(end)
plot(xx, yy)

%% Exs 7.4

clc, clear variables

A = 0.8;
C = 0.1;
g = 9.81;

hp = @(ht) ( 1 - ht/20 - C*sqrt(2*g*ht) )./A;

h0 = 0;
t0 = 0;
dt = 0.5;

tt = [t0];
hh = [h0];
for i = 1:100
    h1 = h0 + dt*hp(h0);
    t1 = t0 + dt;
    
    h0 = h1;
    t0 = t1;
    
    hh = [hh, h0]
    tt = [tt, t0]
end

plot(tt, hh)
hold on

% samma beräkning men med h0 = 3
clc, clear variables

A = 0.8;
C = 0.1;
g = 9.81;

hp = @(ht) ( 1 - ht/20 - C*sqrt(2*g*ht) )./A;

h0 = 3;
t0 = 0;
dt = 0.5;

tt = [t0];
hh = [h0];
for i = 1:100
    h1 = h0 + dt*hp(h0);
    t1 = t0 + dt;
    
    h0 = h1;
    t0 = t1;
    
    hh = [hh, h0]
    tt = [tt, t0]
end

plot(tt, hh)

% samma beräkning men med h0 = 10
clc, clear variables

A = 0.8;
C = 0.1;
g = 9.81;

hp = @(ht) ( 1 - ht/20 - C*sqrt(2*g*ht) )./A;

h0 = 10;
t0 = 0;
dt = 0.5;

tt = [t0];
hh = [h0];
for i = 1:100
    h1 = h0 + dt*hp(h0);
    t1 = t0 + dt;
    
    h0 = h1;
    t0 = t1;
    
    hh = [hh, h0]
    tt = [tt, t0]
end

plot(tt, hh)
hold off

%% Hitta hp = 0

hp = @(ht) ( 1 - ht/20 - C*sqrt(2*g*ht) )./A;

svar = fzero(hp, 3)


%% Exs 7.10
clc, clear variables

dudx = @(x, u) [u(2); -2*x.*u(2) - (u(1).^2)];

x0 = 0.3;
a = 0.3;
b = 10;
n = 100;
h = (b-a)/n;
u0 = [0.1; 0.2]

uu = [u0(1)]
xx = [x0]
for i = 1:n   
    u1 = u0 + h*dudx(x0, u0);
    x1 = x0 + h;
    
    u0 = u1;
    x0 = x1;
    
    uu = [uu, u0(1)]
    xx = [xx, x0]
end
plot(xx, uu)

%% Exs 7.10 - Undersök trunkeringsfelet
clc, clear variables
format long

dudx = @(x, u) [u(2); -2*x.*u(2) - (u(1).^2)];

n = 100
yy = []
for i=1:10
    x0 = 0.3;
    a = 0.3;
    b = 10;
    h = (b-a)/n;
    u0 = [0.1; 0.2];

    for j = 1:n   
        u1 = u0 + h*dudx(x0, u0);
        x1 = x0 + h;

        u0 = u1;
        x0 = x1;
    end
    sista_y = u0(1)
    
    yy = [yy, sista_y]
    n = n*2;
end

trunkeringsfel = abs(diff(yy))

%% Exs 7.10 - Alternativt sätt (utan att definiera u)
clc, clear variables

dydx = @(yp) yp
dypdx = @(x, y, yp) (-2*x.*yp - (y.^2)) % andraderivatan

x0 = 0.3;
y0 = 0.1
yp0 = 0.2

a = 0.3;
b = 10;
n = 100;
h = (b-a)/n;

xx = [x0];
yy = [y0];
for i = 1:n   
    % dy = (dy/dx)*dx = (dy/dx)*h
    dy = h*dydx(yp0);
    y1 = y0 + dy;
    
    % dyp = (dyp/dx)*dx = (dyp/dx)*h
    dyp = h*dypdx(x0, y0, yp0);
    yp1 = yp0 + dyp;
    
    x0 = x0 + h;
    y0 = y1;
    yp0 = yp1;
    
    yy = [yy, y0]
    xx = [xx, x0]
end
plot(xx, yy)

