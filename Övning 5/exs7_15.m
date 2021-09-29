clc, clear variables

a = 0;
b = 1;
n = 10;

h = (b-a)/n;

x0 = a;
y0 = 1;
yp0 = 0;

xx = [x0];
yy = [y0];
for i = 1:n
    y1 = y0 + h*yp0;
    yp1 = yp0 + h*ypp(x0, y0, yp0);
    
    x0 = x0+h;
    y0 = y1;
    yp0 = yp1;
    
    
    xx = [xx, x0];
    yy = [yy, y0];
end

plot(xx, yy)


%% intervallhalvering

i1 = 0.1;
i2 = 1;

for k = 1:10
    a = 0;
    b = 1;
    n = 10;
    h = (b-a)/n;
    x0 = a;
    
    y0 = (i1+i2)/2;
    yp0 = 0;
    
    yy = [y0];
    for i = 1:n
        y1 = y0 + h*yp0;
        yp1 = yp0 + h*ypp(x0, y0, yp0);

        x0 = x0+h;
        y0 = y1;
        yp0 = yp1;
        
        yy = [yy, y0]; 
    end

    if  y0 > 1 % om y var för högt --> y0 var för högt --> i2 = 
        i2 = (i1+i2)/2;
    else 
        i1 = (i1+i2)/2;
    end
    intervall = [i1, i2]
end

plot(xx, yy)
hold on
plot(0, mean(intervall), "x")

function a = ypp(x, y, yp)    
    g = @(y) y*exp( 4*(1-y)/(1+0.2*(1-y)) );
    if x == 0
        a = g(y) / 3;
    else
        a = g(y) - (2/x)*yp;
    end
end


