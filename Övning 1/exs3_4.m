clc, clear variables
f = @(x) x.^6 + 2*x.^4 - 2*x.^2 - 10.^6;

%% plotta grafen (ej krav för att lösa uppgiften)
hold on
x = 0:0.1:15;
fx = f(x)
plot(x, fx)
hold on 

%% Intervallhalveringsmetoden

a = 9;
b = 10;

fa = f(a) % mindre än 0
fb = f(b) % större än 0

for i = 1:20
    m = (b+a)/2;
    fm = f(m);

    if fm > 0
        % x* är i intervallet [0, 10]
        b = m;
        fb = fm;
    else
        a = m;
        fa = fm;
    end 
    
    % plotta datapunkter (ej krav för att lösa uppgiften)
    hold on
    plot(a, fa, "o", 'MarkerSize',8, 'LineWidth', 2)
    plot(b, fb, "x", 'MarkerSize',8, 'LineWidth', 2)
end
hold off

svar = [a, b]
fel = abs(b-a)

