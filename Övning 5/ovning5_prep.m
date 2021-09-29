% Övning 5 prep

%% Exs 7.16 - Finita differensmetoden
n = 100

x0 = 1
xn = 2
h = (b-a)/n

xi = ((x0+h):h:(xn-h))'

P = (1/h^2 + (2-2*xi+xi.^2)./(2*h))
Q = (1 - 2/h^2)*ones(n-1, 1)
R = (1/h^2 - (2-2*xi+xi.^2)./(2*h))

A = diag(Q) + diag(P(2:end), -1) + diag(R(1:end-1), 1)

hl = zeros(n-1, 1)
hl(end) = -R(end)*1

yi = A\hl

plot([1; xi; 2], [0; yi; 1])

%% Exs 7.15 - Inskjutningsmetoden
clc, clear variables

yn = 1

k_low = 0.5
k_high = 1
for i = 1:10
    
    k_mid = (k_low+k_high)/2;

    %gissa på k
    k = k_mid;
    u0  = [k; 0];
    t0 = 0;
    tn = 1;
    
    % Ode45 istället för Eulers metod (blir samma resultat)
    [x, u] = ode45(@dudx, [0, tn], u0);
    sista_y = u(end, 1);
    
    if sista_y > yn
        k_high = k_mid;
    else
        k_low = k_mid;
    end
end

disp([k_low, k_high])

 
function svar = dudx(x, u)
    gu1 = u(1) * exp( 4*(1-u(1)) / (1+0.2*(1-u(1))) );
    if x == 0
        svar = [u(2); gu1/3];
    else
        svar = [u(2); gu1-(2*u(2)/x)];
    end
end



