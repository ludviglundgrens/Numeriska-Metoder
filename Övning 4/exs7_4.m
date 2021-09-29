c = 0.1;
g = 9.81;
dhdt = @(h) h.^2 + h*(-800*c.^2*g-40)+400

rot = fzero(dhdt, 1)

% dhdt kommer därmed vara noll vid 3.478
% --> h kommer vara konstant

%% Eulers formel, Startvärde: h(0) = 0
clc

h0 = 0;
t0 = 0;
dt = 0.001;

hh = [h0];
tt = [t0];
for i=1:100
    h1 = h0 + dt*dhdt(h0);
    
    h0 = h1;
    t0 = t0 + dt;
    
    hh = [hh, h0];
    tt = [tt, t0];
end

plot(tt, hh)
hold on

%% Eulers formel, Startvärde: h(0) = 3
clc

h0 = 3;
t0 = 0;
dt = 0.001;

hh = [h0];
tt = [t0];
for i=1:100
    h1 = h0 + dt*dhdt(h0);
    
    h0 = h1;
    t0 = t0 + dt;
    
    hh = [hh, h0];
    tt = [tt, t0];
end

plot(tt, hh)

%% Eulers formel, Startvärde: h(0) = 3
clc

h0 = 10;
t0 = 0;
dt = 0.001;

hh = [h0];
tt = [t0];
for i=1:100
    h1 = h0 + dt*dhdt(h0);
    
    h0 = h1;
    t0 = t0 + dt;
    
    hh = [hh, h0];
    tt = [tt, t0];
end

plot(tt, hh)