function Final_fintness = Fitness(Population,BlueX,BlueY,RedX,RedY)   

    fit_array_1 = zeros(length(Population),1); % define empty array for hold
    fit_array_2 = zeros(length(Population),1);
    Final_fintness = zeros(length(Population),1);
    RealCordX = zeros (1,length(BlueX)); % define empty array for hold points cordinates
    RealCordY = zeros (1,length(BlueX));
    Point_in_Pol = zeros (length(Population),length(RedX));    
    
    for j=1:length(Population)
%         
        CurrentChrom = Population(j,:);
        RealLength = CurrentChrom(1,end);
        CurrentBrPoint = CurrentChrom(end-1); %extract current chrom brPoint  
        
%        BB = InjectChrom(BlueX,BlueY,length(CurrentChrom));
        % want to extract real coordinates (BP and RL is seperated before send)
        RealCord = BuildRealCordinates(CurrentChrom(1:RealLength),BlueX,BlueY);
        RealCordX= RealCord(1,:);
        RealCordY= RealCord(2,:);
        
%        
%       % create 2 PolyGon
        PolyGon_1 = polyshape(RealCordX(1:CurrentBrPoint),RealCordY(1:CurrentBrPoint));         % create PolyGon_1
        PolyGon_2 = polyshape(RealCordX(CurrentBrPoint+1:end),RealCordY(CurrentBrPoint+1:end)); % create PolyGon_2
%       %disp("we created first PolyShapes");
%              
        polyIntersect = intersect(PolyGon_1,PolyGon_2); %intersect of two polygon        
        
        % hold red points included in each polygon (1: yes , 0 : No)
        for i =1: length(RedX)  
            Red_in_Pol_1(j,i) = inpolygon(RedX(i),RedY(i),RealCordX(1:CurrentBrPoint),RealCordY(1:CurrentBrPoint));
            Red_in_Pol_2(j,i) = inpolygon(RedX(i),RedY(i),RealCordX(CurrentBrPoint+1:end),RealCordY(CurrentBrPoint+1:end));
        end
        
        % hold Blue points included in each polygon (1: yes , 0 : No)
        for i =1: length(BlueX)  
            Blue_in_Pol_1(j,i) = inpolygon(BlueX(i),BlueY(i),RealCordX(1:CurrentBrPoint),RealCordY(1:CurrentBrPoint));
            Blue_in_Pol_2(j,i) = inpolygon(BlueX(i),BlueY(i),RealCordX(CurrentBrPoint+1:end),RealCordY(CurrentBrPoint+1:end));
        end
        
        
        % sum red points included in each polygon
        RedPointsIncluded_1= sum(Red_in_Pol_1(j,:));
        RedPointsIncluded_2= sum(Red_in_Pol_2(j,:));
            
        % sum red points included in each polygon
        BluePointsIncluded_1= sum(Blue_in_Pol_1(j,:));
        BluePointsIncluded_2= sum(Blue_in_Pol_2(j,:));
        

        % check if Polygons have intersect or not? if they have the must
        % get a very awful fitness
        if CurrentBrPoint < 3 || (RealLength - CurrentBrPoint)<3
            Final_fintness(j,1) = -10000;
            
%         elseif RealLength < floor(length(CurrentChrom)/2)
%             Final_fintness(j,1) = -5000;
        
            
        elseif polyIntersect.NumRegions > 0 || (PolyGon_1.NumRegions >1)||(PolyGon_1.NumHoles >0) ||(PolyGon_2.NumRegions >1)||(PolyGon_2.NumHoles >0)
            Final_fintness(j,1) = -10000;
            
        else
            Weight3 = 6;
            %calculate fitness for each polygon
            fit_array_1(j,1)=  Weight3 * BluePointsIncluded_1 -  1*RedPointsIncluded_1;
            fit_array_2(j,1)=  Weight3 * BluePointsIncluded_2 -  1*RedPointsIncluded_2;
%             fit_array_1(j,1)=  Weight3 * BluePointsIncluded_1 ;
%             fit_array_2(j,1)=  Weight3 * BluePointsIncluded_2 ;
            TotalBlue = BluePointsIncluded_1 + BluePointsIncluded_2;
            % calculate final fitness 
            Final_fintness(j,1) = TotalBlue + fit_array_1(j,1) + fit_array_2(j,1);
%             Final_fintness(j,1) = TotalBlue ; % in gaahi khub javab mide
        end
        
        
    end

end
