x_blue = [10,12,4,13,6,17,21,4,8,2];
y_blue = [19,15,12,4,7,9,4,6,9,1];
plot (x_blue,y_blue,'*','color','blue');
hold on
x_red = [19,15,11,17,15,4,13,7];
y_red = [10,12,8,7,15,12,14,9];
plot (x_red,y_red,'o','color','red');

[xsorted,ySorted]=sortByAngle(x_blue,y_blue);
pgon = polyshape(xsorted,ySorted);
plot(pgon)
Point_in_Pol = [];
for i =1: length(x_red)
    Point_in_Pol(i) = inpolygon(x_red(i),y_red(i),xsorted,ySorted);
end


