function population = initPopulation (x_blue,y_blue,x_red,y_red,chrom_len, popSize)

    population = zeros(popSize,chrom_len); %generate empty array for population
    
    %----------- for version 2 with sorted point-------------
    % generation random Permutation for points 
    % minus two because of break point and real length
    chromCore = randperm(chrom_len-2,chrom_len-2);    
    
    %sort Permutation based on the Clockwies
    SortedPoint = SortChrom(x_blue,y_blue,chromCore);  % for version 2 | with sorted point
    %----------- for version 2 with sorted point-------------
    
    
    % generate random chrmosome for population
    for i=1:popSize     
        x = generateChrom (x_blue,y_blue,x_red,y_red,chrom_len,SortedPoint); % for version 2 | with sort points
%         x = generateChrom (x_blue,y_blue,chrom_len);           % for version 1 | means : without Points sorting
        population (i,:) = x;
        xRealLength = x(1,end);            % best solution Real Length                  
        xBrPoint = x(1,end-1);
        xSol = x(1,1:xRealLength);
        PlotChromPolygon(xSol,xBrPoint,x_blue,y_blue,x_red,y_red); 
    end

end
