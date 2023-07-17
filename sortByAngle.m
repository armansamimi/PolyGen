function [sortedX, sortedY] = sortByAngle(X,Y)
    xCenter= X(1);
    yCenter= Y(1);
    x = X(2:end);
    y = Y(2:end);
    %x = [0,1,1,0,6,17,21,4,8,2];
    %y= [1,1,0,0,7,9,4,6,9,1];
    %xCenter = mean(x);
    %yCenter = mean(y);
    angles = atan2d((y-yCenter) , (x-xCenter));
    [sortedAngles, sortIndexes] = sort(angles);
    newx = x(sortIndexes);  % Reorder x and y with the new sort order.
    newy = y(sortIndexes);
    sortedX=cat(2,xCenter,newx);
    sortedY=cat(2,yCenter,newy);
    %hold on
    %plot (x,y,'o','color','red');
    %plot (xCenter,yCenter, 'r*')

end