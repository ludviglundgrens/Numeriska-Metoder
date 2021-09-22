%% Exs 6.4 (från övning 3)
clc, clear variables
f = @(x) 30./(1 + x.^4 + sqrt(1 + x.^3))

A = 215;
int = quad(f, 0, A)



%% Uppgift 1
clc, clear variables
f = @(x) cos(x) - x 

%xi = -5:0.1:5
%plot(xi, f(xi))

svar = fzero(f, 1)

%% Uppgift 2
clc, clear variables
x = [2; 4; 7; 9];
y = [6; 3; 2; 5];
p = polyfit(x, y, 2);
svar = polyval(p, 8)

%% Uppgift 3
% y(3) kommer att variera
% för vilket y(3) får vi mkvanpassning(x, y) = 3
clc, clear variables

y3 = 1.3
%svar = mkv_anpassning(y3)

% Vi söker: mkvanpassning(y3) = 3 --> mkvanpassning(y3) - 3 = 0
svar = fzero(@mkv_anpassning, y3)

% function svar = mkv_anpassning(y3)
%     x = [2; 4; 7; 9];
%     y = [6; 3; y3; 5]; % y(3) varierar
%     
%     p = polyfit(x, y, 2);
%     svar = polyval(p, 8) - 3; % MKV-anpassning vid x = 8 (minus 3)
% end

%% Uppgift 1

% b)
svar = I(0.5, 4) 

function svar = I(k, N)
    a = -1; b = 1;
    h = (b-a)/N;
    
    xi = a:h:b;
    yi = cos(pi*xi)./(xi.^2 + k^2);
    
    Th = h*(sum(yi) - (yi(1) + yi(end))/2);
    
    svar = Th;
end

% c)




