%% K.3
clc, clear variables
yp = @(x, y) -y + x.^2;

% y(1) = 2 
y0 = 2;  % y (index 0)
x0 = 1;  % x (index 0)

a = x0;
b = 1.5;
n = 1000;

h = (b-a)/n

xx = [x0];
yy = [y0];

for i = 1:n
    y1 = y0 + h*yp(x0, y0)
    x1 = x0 + h;

    y0 = y1;
    x0 = x1;
    
    xx = [xx, x0];
    yy = [yy, y0];
end

plot(xx, yy)

%% Hur många intervall bör vi ha?
clc, clear variables
yp = @(x, y) -y + x.^2;

for n = 2.^(1:10)
    y0 = 2;  % y (index 0)
    x0 = 1;  % x (index 0)

    a = x0;
    b = 1.5;
    %n = 100;

    h = (b-a)/n;

    for i = 1:n
        y1 = y0 + h*yp(x0, y0);
        x1 = x0 + h;

        y0 = y1;
        x0 = x1;
    end
    y_slut = y0
end

%% K 6.5
clc, clear variables

dudx = @(x, u) [u(2); -2*x.*u(2) - (u(1).^2)];

u0 = [0.1; 0.2]
x0 = 0.3

a = x0;
b = 10;

n = 100;
h = (b-a)/n;

uu = [u0(1)];
xx = [x0]
for i = 1:n
    u1 = u0 + h*dudx(x0, u0);
    x1 = x0 + h;
    
    u0 = u1;
    x0 = x1;
    
    uu = [uu, u0(1)];
    xx = [xx, x0];
end

u_slut = u0
plot(xx, uu)

%% Exs 7.4
clc, clear variables

A = 0.8;
C = 0.1;
g = 9.81;

htp = @(ht) ( 1 - ht/20 - C*sqrt(2*g*ht) )./A;

% Test 1: h(0) = 0
h0 = 0;
t0 = 0;
dt = 0.1;

hh = [];
tt = [];
for i=1:500
    h1 = h0 + dt*htp(h0);
    t1 = t0 + dt;
    
    h0 = h1;
    t0 = t1;
    
    hh = [hh, h0];
    tt = [tt, t0];
end

plot(tt, hh)
hold on

% Test 2: h(0) = 3
h0 = 3;
t0 = 0;
dt = 0.1;

hh = [];
tt = [];
for i=1:500
    h1 = h0 + dt*htp(h0);
    t1 = t0 + dt;
    
    h0 = h1;
    t0 = t1;
    
    hh = [hh, h0];
    tt = [tt, t0];
end

plot(tt, hh)

% Test 3: h(0) = 10
h0 = 10;
t0 = 0;
dt = 0.1;

hh = [];
tt = [];
for i=1:500
    h1 = h0 + dt*htp(h0);
    t1 = t0 + dt;
    
    h0 = h1;
    t0 = t1;
    
    hh = [hh, h0];
    tt = [tt, t0];
end

plot(tt, hh)
hold off

%% Hitta jämvikt

clc, clear variables
A = 0.8;
C = 0.1;
g = 9.81;
htp = @(ht) ( 1 - ht/20 - C*sqrt(2*g*ht) )./A;

% Jämvikt då htp = 0 --> använd fzero

svar = fzero(htp, 3.5)


%% Exs 7.9
clc, clear variables
my0 = 0.1;
a = 0.15;
b = 0.9;
g = 9.81;

dudt = @(u) [u(2); -g*my0*(1 + a*u(2)^b)];

u0 = [0; 8];
t0 = 0;

dt = 0.1;

tt = []
uu = []
for i = 1:100
    u1 = u0 + dudt(u0)*dt;
    t1 = t0 + dt;
    
    u0 = u1;
    t0 = t1;
    
    if u1(2)<0
        break    
    end
    
    tt = [tt, t0]
    uu = [uu, u0(1)]
end
plot(tt, uu)


