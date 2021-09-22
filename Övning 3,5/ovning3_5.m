%% Övning 3.5

%% 6.4
clc, clear variables

f = @(x) 30./(1 + x.^4 + sqrt(1 + x.^3));
a = 0;
b = 216;
int = quad(f, a, b)

%% 6.4 version 2

f = @(x) 30./(1 + x.^4 + sqrt(1 + x.^3));
a = 0;
b = 10;

ii = []
for i = 1:10
    int = quad(f, a, b)
    b = b*2;
    
    ii = [ii, int];
end

diff(ii)

%% Uppgift 1 
clc, clear variables
f = @(x) cos(x) - x 
x0 = 1

svar = fzero(f, x0)


%% Uppgift 2
% A)
clc, clear variables
x = [2; 4; 7; 9];
y = [6; 3; 2; 5];
p = polyfit(x, y, length(x) - 1);
svarA = polyval(p, 8);

% B)
p = polyfit(x, y, 2);
svarB = polyval(p, 8);

% C)
svar = fzero(@funk, 1.3)

function svar = funk(y3)
    x = [2; 4; 7; 9];
    y = [6; 3; y3; 5];

    p = polyfit(x, y, 2);
    polynomvarde = polyval(p, 8);
    
    % f(y3) = mkm(y3) - 3
    svar = polynomvarde - 3;
end





