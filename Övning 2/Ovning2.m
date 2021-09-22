%% Repetition om konvergens (ekvation från Övning 1 - A2)
clc, clear variables
f = @(x) x.^3  - 2;
fp = @(x) 3*x.^2;
x0 = 5;

% Newton-Rhapson: x1 = x0 - f/fp
ee = [];
for i=1:8
    dx = f(x0)/fp(x0);
    x1 = x0 - dx;
    
    abserr = abs(dx);
    ee = [ee, abserr];
    x0 = x1;
end

% Linjär konvergens? e(1) = c*e(2)^1 -> e(1)/e(2) = c
linj= [ee(2)/ee(1)
       ee(3)/ee(2)
       ee(4)/ee(3)
       ee(5)/ee(4)
       ee(6)/ee(5)
       ee(7)/ee(6)
       ee(8)/ee(7)]

% Kvadratisk konvergens? e(1) = c*e(2)^2 -> e(1)/e(2)^2 = c
kvad = [ee(2)/(ee(1)^2)
        ee(3)/(ee(2)^2)
        ee(4)/(ee(3)^2)
        ee(5)/(ee(4)^2)
        ee(6)/(ee(5)^2)
        ee(7)/(ee(6)^2)
        ee(8)/(ee(7)^2)]
    
%% Konvergens kan analyseras direkt i loopen
clc, clear variables
f = @(x) x.^3  - 2;
fp = @(x) 3*x.^2;

x0 = 5;
ee = [];
for i=1:8
    dx = f(x0)/fp(x0);
    x1 = x0 - dx;
    
    abserr = abs(dx);
    ee = [ee, abserr];
    x0 = x1;
    
    if i > 1
        % Analysera konvergens
        % linj = ee(end)/ee(end-1)
        kvad = ee(end)/(ee(end-1)^2)
    end
end

%% 4.17
clc, clear variables

A = [1, 1; 1, 17]
y = [66; 666]

c = A^-1*y
P = @(x) c(1) + c(2)*x;

plot([1,17], [66, 666], "x")
hold on
x = 1:0.1:17;
plot(x, P(x))
hold off

%% Modifierad 4.17
clc, clear variables

x = [1; 17; 20];

A = [ones(3,1), x, x.^2]
y = [66; 666; 666]

c = A^-1*y
P = @(x) c(1) + c(2)*x + c(3)*x.^2;

plot(x, y, "o")
hold on
x = [1:0.1:25];
plot(x, P(x))
hold off

%% 4.3
%% a)
clc, clear variables
t = [0;1;3;4];
y = [1;8;11;20];

A = [ones(4,1), t];

%c = (A'*A)^-1*(A'*y)
c = A\y
f = @(t) c(1) + c(2)*t;

plot(t, y, "x")
hold on
T = 0:0.1:4;
plot(T, f(T))
hold off

% residual
fel = y - f(t);
fel_norm =  norm(fel)

%% b)
clc, clear variables

t = [0;1;3;4];
y = [1;8;11;20];

A = [ones(4,1)];

c = A\y
f = @(t) c(1) + 0*t;

plot(t, y, "x")
hold on
T = 0:0.1:4;
plot(T, f(T)) % kan även göras med xline(x)
hold off

% residual
res = y - f(t);
res_norm =  norm(res)

%% c)
clc, clear variables

t = [0;1;3;4];
y = [1;8;11;20];

A = t;

c = A\y
f = @(t) c(1)*t;

plot(t, y, "x")
hold on
T = 0:0.1:4;
plot(T, f(T))
hold off

% residual
fel = y - f(t);
fel_norm =  norm(fel)

%% 4.14
clc, clear variables

p = [10; 16; 25; 40; 60];
q = [94; 118; 147; 180; 230];
A = [ones(5,1), log(p)]

c = A\log(q);
c(1) = exp(c(1)) % den förstsa termen är egentligen ln(c1)

Q = @(p) c(1)*p.^c(2);

plot(p, q, "o")
hold on
P = p(1):0.1:p(end);
plot(P, Q(P))
hold off

% residual
fel = q - Q(p);
fel_norm =  norm(fel)

%% 5.4
clc, clear variables

D = [17; 18; 18; 19; 22] + [28; 0; 31; 56; 34]/60;
P = [55.7; 57.7; 59.3; 62.6; 65.6];

A1 = [ones(3,1), P(2:4), P(2:4).^2]; % skapa matris för punkt 2:4
c1 = A1\D(2:4)

f1 = @(D) c1(1) + c1(2)*D + c1(3)*D.^2; % skapa funktion baserat på A1
svar1 = f1(61.7); % interpolerat svar baserat på punkt 2:4

A2 = [ones(3,1), P(3:5), P(3:5).^2]; % skapa matris för punkt 3:5
c2 = A1\D(3:5)

f2 = @(D) c2(1) + c2(2)*D + c2(3)*D.^2; % skapa funktion baserat på A2
svar2 = f2(61.7); % interpolerat svar baserat på punkt 3:5

medel = (svar1+svar2)/2
fel = abs(svar1-svar2)

