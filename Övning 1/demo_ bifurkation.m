%% Plot
% (vackra) problem som kan uppstå i fixpunktsiterering 
% när derivatan är större än 0
f = @(x_n, k) k.*x_n.*(1-x_n);

x = 0:0.01:1;
k = 3;
fx = f(x, k);

plot(x, fx)
hold on
plot(x,x)

k = 2;
fx = f(x, k);

plot(x, fx)
hold off


%%
k = 3;
dataframe = [];
x_n = 0.5;
error = 1;
tol = 10e-6;
counter = 1;

while abs(error) > tol & counter < 1000
        x_np1 = f(x_n, k)
        error = x_np1 - x_n;

        x_n = x_np1
        counter = counter + 1;
        
        dataframe = [dataframe; counter, x_n];
end

plot(dataframe(:,1), dataframe(:,2))

%% 
dataframe = [];

for k=0:0.01:4  
    error = 1;
    tol = 10e-5;
    counter = 1;
    x_n = 0.5;
    while abs(error) > tol & counter < 50
        x_np1 = f(x_n, k)
        error = x_np1 - x_n;

        x_n = x_np1;
        counter = counter + 1;
    end
    dataframe = [dataframe; k, x_n];
end




