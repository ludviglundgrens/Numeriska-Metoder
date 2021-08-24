P = [55.7; 57.7; 59.3; 62.6; 65.6];
L = [17+28/60; 18; 18+31/60; 19+56/60; 22+34/60];

plot(P, L)
hold on

%% linjär interpolation

A = [P(3:4), ones(2,1)];
k = A\L(3:4);

f = @(x) k(1)*x + k(2);

P_int = P(1):0.1:P(end);
L_int = f(P_int);

plot(P_int, L_int)
hold on 

p_1  = f(61.7);
plot(61.7, p_1, "*")

%% kvadratisk interpolation

A = [P(3:5).^2, P(3:5), ones(3,1)]
k = A\L(3:5)

f = @(x) k(1)*x.^2 + k(2)*x + k(3);

P_int = P(1):0.1:P(end);
L_int = f(P_int);

plot(P_int, L_int)
hold on
p_2  = f(61.7);

plot(61.7, p_2, "o")

%% estimera trunkeringfel
err = abs(p_1-p_2)
rel_err = err/p_1
