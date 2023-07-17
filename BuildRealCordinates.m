function [chromCordinates] = BuildRealCordinates(chromIndexes,x_blue,y_blue)
% this function convert indexes to Real Coordinates based on x_blue and
% y_blue | chrom in GA just carry indexes not cordinates
    
    chromX = zeros (1,length(chromIndexes));
    chromY = zeros (1,length(chromIndexes));
    for i = 1:length(chromIndexes) %for valid indexex
           if chromIndexes(i)~= 0
           chromX(i) =  x_blue(chromIndexes(i)) ; % assign related coodrdinate
           chromY(i) =  y_blue(chromIndexes(i)) ;
           end
    end
    chromCordinates = zeros (2,length(chromIndexes));
    chromCordinates(1,:) = chromX;                  % return chromCordinates
    chromCordinates(2,:) = chromY;
end