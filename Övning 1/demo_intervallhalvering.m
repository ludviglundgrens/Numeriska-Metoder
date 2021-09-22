clc, clear variables
f = @(x) exp(x) - 10*cos(x);

a = 0;
b = pi;

fa = f(a) % mindre än 0
fb = f(b) % större än 0

for i = 1:20
    mellan = (b+a)/2;
    fmellan = f(mellan);

    if fmellan > 0
        % x* är i intervallet [0, pi/2]
        b = mellan;
        fb = fmellan;
    else
        a = mellan;
        fa = fmellan;
    end 
    
    % plotta datapunkter (ej krav för att lösa uppgiften)
    hold on
    plot(a, fa, "o", 'MarkerSize',8, 'LineWidth', 2)
    plot(b, fb, "x", 'MarkerSize',8, 'LineWidth', 2)
end
hold off

svar = [a, b]
fel = abs(b-a)

%% plotta grafen (ej krav för att lösa uppgiften)
hold on
x = 0:0.1:2;
fx = f(x)
plot(x, fx)
hold on 
