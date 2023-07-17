x_blue = [5,3,5,10,9,15,11];
y_blue = [11,4,2,1,5,13,15];

BreakPoint =7;

x_red = [2,22,3,8];
y_red = [2,12,16,3];
poly1X = x_blue(1,1:BreakPoint);
poly1Y=y_blue(1,1:BreakPoint);


pgon1 = polyshape(poly1X,poly1Y);
plot(pgon1)
hold on
plot (x_red,y_red,'o','color','red');
plot (x_blue,y_blue,'*','color','blue');
