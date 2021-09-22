%%
clc, clear variables
figh = figure
x = [1; 2; 3];
y = [2; 6; 5];

plot(x,y)
A = [ones(3,1), x];

% Plotta kolumnvektorerna i A
quiver3(0,0,0,0,1,0, 'LineWidth', 3,'Color', 'r')
text(0,1,0.05, "Kolumnvektor 1 ($$\bar{u}$$)", 'FontSize',13, 'Color', 'r', 'Interpreter','Latex')
hold on
quiver3(0,0,0,1,0,0, 'LineWidth', 3, 'Color', 'b')
text(1,0,0.05, "Kolumnvektor 2 ($$\bar{v}$$)", 'FontSize',13, 'Color', 'b', 'Interpreter','Latex')
quiver3(0,0,0,1,1,1, 'LineWidth', 3, 'Color', 'm')
text(0.95,0.95,0.95, "oberoende variabel ($$\bar{y}$$)", 'FontSize',13, 'Color', 'm', 'Interpreter','Latex')

%add plane
[x y] = meshgrid(0:0.1:2); % Generate x and y data
z = zeros(size(x, 1)); % Generate z data
s = surf(x, y, z)
s.EdgeColor = 'none'

%add residual and A*c
quiver3(0.9,0.9,0.9,0,0,-1, 'LineWidth', 3, 'Color', '#FF8129')
text(0.95,0.95,0.5, "Residual/Fel ($$A\bar{c}-\bar{y}$$)", 'FontSize',13,  'Color', '#FF8129', 'Interpreter','Latex')
quiver3(0,0,0,1,1,0, 'LineWidth', 3, 'Color', 'black')
text(1,1,0.05, "Bra anpassad vektor ($$A\bar{c}$$)", 'FontSize',13, 'Color', 'black', 'Interpreter','Latex')
hold off

for i=1:220
   view([25+i/5, 30])
   movieVector(i) = getframe(figh, [10 10 520, 400]);
end


%%
writer = VideoWriter('curve0', 'MPEG-4');
writer.FrameRate = 20;

open(writer);
writeVideo(writer, movieVector)
close(writer)


%% plotta cirkel
r = 3;
a = 0;
b = 0;

ezplot(@(x,y) (x-a).^2 + (y-b).^2 -r^2)
axis equal