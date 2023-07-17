function  PlotChromPolygon(chrom,BestChromBreakPoint,x_blue,y_blue,x_red,y_red)

    % extract real coordinates
    RealCord = BuildRealCordinates(chrom,x_blue,y_blue);
    RealCordX= RealCord(1,:);
    RealCordY= RealCord(2,:);
    hold on
    %plot 1st ploygon
    poly1X = RealCordX(1,1:BestChromBreakPoint);
    poly1Y=RealCordY(1,1:BestChromBreakPoint); 
    pgon1 = polyshape(poly1X,poly1Y);
    plot(pgon1)
    hold on
    
    %plot 2nd polygon
    poly2X = RealCordX(1,BestChromBreakPoint+1:end);
    poly2Y=RealCordY(1,BestChromBreakPoint+1:end);
    pgon2 = polyshape(poly2X,poly2Y);
    plot(pgon2)
    % plot blue and red points
    hold on
    plot (x_red,y_red,'o','color','red');
    plot (x_blue,y_blue,'*','color','blue');
    x=2;
end