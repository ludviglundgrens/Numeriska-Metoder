%% överbestämt system

x = [1; 2; 3];
y = [2; 6; 5];

plot(x,y)

% skapa matris

% A*c = y
A = [ones(3,1), x];

% Plotta kolumnvektorerna i A
quiver3(0,0,0,1,0,0, 'LineWidth', 3)
hold on
quiver3(0,0,0,0,1,0, 'LineWidth', 3)
quiver3(0,0,0,2,2,2, 'LineWidth', 3)

%% add plane
[x y] = meshgrid(0:0.1:2); % Generate x and y data
z = zeros(size(x, 1)); % Generate z data
surf(x, y, z)

%% add residual and A*c
quiver3(1.8,1.8,1.8,0,0,-2, 'LineWidth', 3)
quiver3(0,0,0,2,2,0, 'LineWidth', 3)
hold off
