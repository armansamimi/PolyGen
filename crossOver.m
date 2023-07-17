function newChrom = crossOver(population ,CrossRate,x_blue)
    % here, 2 parents will be choose for Recombination
    % the Break Point(BP) and Real Length(RL) always selected from parent 2 
    % (because they are on the two last genes)
    
    MaxSizeChrom = length(population(1,:));                                 
    %CrossRate = 0.3 ;                                      % CrossRate 
    %population = randi(MaxSizeChrom,20,MaxSizeChrom);      % fake pop
    chrom_len = length(population(1,:));
    popSize = length(population);                           % popsize
    child = zeros(popSize,chrom_len);
    child1 = zeros(popSize,chrom_len);
    for i=1:popSize                                         % scan all the population
        randomTrigger = rand(1,1) ;                         % generate random trigger
        if randomTrigger < CrossRate                        % check fire trigger
            parents = randi([1 popSize],1,2);               % select two random index for parents
            midPoint = randi([2 chrom_len-2],1,1);          % select midpoint for corssover
            parent1 = population(parents(1),:);             % select parent 1
            parent2 = population(parents(2),:);             % select parent 2
            child1(i,:) = cat(2,parent1(1:midPoint) , parent2(midPoint+1:MaxSizeChrom)); %generate child from two parent
            child2= ValidateChrom(x_blue,child1(i,:));      % check points validation and duplication
            %Finalchild = SortChrom(x_blue,y_blue,child2);   % sort points in clockwise because of polygon
            child(i,:) = child2 ;
        end

    end
    child( all(~child,2), : ) = [];                         % remove zero rows from  child Matrix
    newChrom=child;
    
end
