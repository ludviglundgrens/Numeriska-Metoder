clc, clear variables
A = [1,1; 1,2; 1,4; 1,5]
y = [1; 4; 5; 7]
b = log(y)

%% hitta konstanter
c = ((A'*A)^-1)*A'*b
c(1) = exp(c(1)) 

%% plotta
x = 0:0.1:5;
f = @(x) c(1)*exp(c(2)*x);
plot(A(:,2), y, "o")
hold on 
plot(x, f(x))
hold off