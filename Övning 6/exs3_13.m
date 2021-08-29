clc, clear variables

% startvärden 
f = @(x) (((0.5-x).*(1.5-x))./2).^(1/2)-x;
x3 = fzero(f, 0.1);

x1 = 0.5-x3;
x2 = 1.5-x3;
x4 = x3;
x5 = 0;

X0 = [x1; x2; x3; x4; x5]; % skapa vektor av startvärden

% newtons metod för system
F = @(x)[ x(1)+x(3)+x(5)-0.5; 
          x(2)+x(3)-x(5)-1.5;
          x(3)-3*x(5)-x(4);
          x(4)*x(3)-0.5*x(1)*x(2);
          x(5)*x(2)*(x(1)+x(2)+x(3)+x(4)+x(5))^2-0.09*x(1)*x(4)^3 ];

s = 1e-5;
J = @(x) [(F(x+[s;0;0;0;0])-F(x))/s, (F(x+[0;s;0;0;0])-F(x))/s, (F(x+[0;0;s;0;0])-F(x))/s, (F(x+[0;0;0;s;0])-F(x))/s, (F(x+[0;0;0;0;s])-F(x))/s];

tol = 0.5e-5;
err = 1;
iter = 1;

xx = [X0'];
E = [];
while abs(err) > tol && iter < 10
    dx = J(X0)\F(X0);
    X1 = X0 - dx;
   
   err = norm(dx);
   X0 = X1;
   
   xx = [xx; X1'];
   E = [E, err];
   
   iter = iter+1;
end




