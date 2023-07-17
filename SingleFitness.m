function Final_fintness = SingleFitness(Chrom,BlueX,BlueY,RedX,RedY)
    
    %______________________________________________________________________
    %     x_blue = [1,1,10,10,5,5];                            % for test
    %     y_blue = [1,10,1,10,8,0];                            % for test
    %     x_red = [7,2,12,3];                                  % for test
    %     y_red = [12,2,12,3];                                 % for test
    %     MaxSizeChrom = length(x_blue);                       % for test
    %     Population = randi(MaxSizeChrom,20,MaxSizeChrom);    % for test
    %______________________________________________________________________    

    
    RealCordX = zeros (1,length(BlueX)); % define empty array for hold points cordinates
    RealCordY = zeros (1,length(BlueX));
   
    
        RedPointsIncluded = 0;
        BluePointsIncluded = 0;
        CurrentChrom = Chrom;
        RealCord = BuildRealCordinates(CurrentChrom(1:end-1),BlueX,BlueY); % want to extract real coordinates (break point is seperated before send)
        RealCordX= RealCord(1,:);
        RealCordY= RealCord(2,:);
        CurrentBrPoint = CurrentChrom(end);
        
        PolyGon_1 = polyshape(RealCordX(1:CurrentBrPoint),RealCordY(1:CurrentBrPoint));
        NoBadTh_1 = PolyGon_1.NumRegions + PolyGon_1.NumHoles;

        PolyGon_2 = polyshape(RealCordX(CurrentBrPoint:end),RealCordY(CurrentBrPoint:end));
        NoBadTh_2 = PolyGon_2.NumRegions + PolyGon_2.NumHoles;
        
        polyIntersect = intersect(PolyGon_1,PolyGon_2);
        IntersectReg = polyIntersect.NumRegions;
        Weight = 6; % weight of IntersectionRegions in Final fitness function | more mean more effect
        
        for i =1: length(RedX)  
            Point_in_Pol_1(i) = inpolygon(RedX(i),RedY(i),RealCordX(1:CurrentBrPoint),RealCordY(1:CurrentBrPoint));
            Point_in_Pol_2(i) = inpolygon(RedX(i),RedY(i),RealCordX(CurrentBrPoint+1:end),RealCordY(CurrentBrPoint+1:end));
        end
        
        RedPointsIncluded_1= sum(Point_in_Pol_1);
        RedPointsIncluded_2= sum(Point_in_Pol_2);
        BluePointsIncluded_1= sum(CurrentChrom(1:CurrentBrPoint)~=0,2);
        BluePointsIncluded_2= sum(CurrentChrom(CurrentBrPoint+1:end)~=0,2);
        
        fit_array_1(1)=BluePointsIncluded_1-RedPointsIncluded_1-(NoBadTh_1*NoBadTh_1);
        fit_array_2(1)=BluePointsIncluded_2-RedPointsIncluded_2-(NoBadTh_2*NoBadTh_2);
        Final_fintness = fit_array_1 + fit_array_2 - IntersectReg*IntersectReg ;
    
% hold on
% plot(PolyGon);
% hold on
% plot (redX,redY,'*','color','red');
% plot (VertexX,VertexY, 'rO')
end