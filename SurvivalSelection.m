function [FinalPop,sortetFit,AverageGeneration,BestIndex,BestSolution,BestFitness] = SurvivalSelection (mutatedPop ,Population ,x_blue,y_blue,x_red,y_red)
    
    %MaxSizeChrom=10;                                % fake
    %mainPop = randi(MaxSizeChrom,20,MaxSizeChrom);  % fake pop
    %childPop = randi(MaxSizeChrom,10,MaxSizeChrom); % fake pop
    %mainPopSize = length (mainPop);
%     TotalPopTemp = cat (1,mutatedPop , crossedPop);  %concat CrossedPop and MutatedPop
    TotalPop =cat(1,mutatedPop,Population);        %concat mainPop and ChildPop

    [NoSelectedChrom,~] = size (Population);         %NoSelectedChrom to survive = pop size 
    %TotalPopSize = length (TotalPop);
    fitness = Fitness(TotalPop,x_blue,y_blue,x_red,y_red); % calculate fitness function

    [sortetFit, SortedIndex] = maxk(fitness,NoSelectedChrom); % pick best chromosome (size = pop size)

    FinalPop=TotalPop(SortedIndex,:);       % assign best chrom to final pop to survive
    BestIndex = SortedIndex(1,1);           % hold best index
    BestSolution = FinalPop (1,:);          % hold best solution
    BestFitness =sortetFit(1,:);            % hold best fitness
    AverageGeneration = mean(sortetFit);    % calculate mean of the generation
                         
    
end