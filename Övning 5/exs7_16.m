% RVP:  y'' - x*y' + y = 0

clc, clear variables
a = 1;
b = 2;

n = 100;
h = (b-a)/n;

x = (a+h):h:(b-h); % vill bara ha inre punkter (exkludera x0 och xn)

A = 1/h^2 + x./(2*h);
B = (1-2/(h^2))*ones(length(x), 1);
C = 1/h^2 - x./(2*h);

A_matris = diag(B) + diag(A(2:end), -1) + diag(C(1:end-1), 1);

b = zeros(length(x),1);
b(end) = - C(end);

% A*y = b --> y = A\b

y = A_matris\b

plot([1; x'; 2], [0; y; 1])

%% Exs 7.16 - Inskjutningsmetoden
clc, clear variables
x0 = 1 % eller a
xn = 2 % eller b

y0 = 0
yn = 1
dudx = @(x, u) [u(2); (2-2*x+x.^2)*u(2)-u(1)]

under = 0.5
over = 1

for i = 1:10
    % Gissa på ett y'(0)
    
    middle = (under + over)/2

    % Skapa u0
    u0 = [y0; middle];
    
    [x, u] = ode45(dudx, [x0, xn], u0);
    sista_y = u(end, 1);
    
    if sista_y > yn
        over = middle;
    else
        under = middle;
    end
    
end
disp([under, over])
