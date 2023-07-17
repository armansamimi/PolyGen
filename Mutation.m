function mutatedPop = Mutation (population,x_blue,mutRate)
    %x_blue = [1,1,10,7,8];                                 %fake
    firstChrom = population(1,:);
    MaxSizeChrom = length (firstChrom);
    popSize= length(population);
    %population = randi(MaxSizeChrom,popSize,MaxSizeChrom); % fake pop
    mutatedPop = zeros(popSize,MaxSizeChrom);
    %population_old = population ;   
    mutatedChrom = [];
    NoMutation = 0 ;
    j=1;
    for i=1:popSize                                                 % scan pop, find random chroms, mutate them
            randomTrigger = rand(1,1) ;                             % random trigger for apply mutation
            if randomTrigger < mutRate                              % check trigger with mutRate
%                 NoMutation = NoMutation +1;
%                 randomIndex = randperm(MaxSizeChrom-2,1);           % choonse an random index (1 to end-1) for replacing | except last 2 gen (BR & RL)
%                 newGen = randperm(MaxSizeChrom-2,1);                % choonse an random new Gen (point)
%                 population(i,randomIndex) = newGen ;                % replace new gen
                
                % ----------------------------------------------------------------------------
                
%                 RealLength = randi([floor(3*MaxSizeChrom/4) MaxSizeChrom-2],1);
                
%                 BreakPoint = randi([4 RealLength-4],1);          % genereate random break point for 2 polygon
                
                BreakPoint = randi([4 MaxSizeChrom-5],1);          % genereate random break point for 2 polygon
                StartRL = max (BreakPoint+2 , MaxSizeChrom-5);
                RealLength = randi([StartRL MaxSizeChrom-2],1); %generate and Real Lenght means that an solution could include fewer Blue point not all of them
    
%                 RealLength = randi([BreakPoint+2 MaxSizeChrom-2],1);   %(basic)
                % replace Real Length
                
                % -----------------------------------------------------------------------------
                population(i,end-1) = BreakPoint ;                  % (basic)replace breakPoint
                population(i,end) = RealLength ;          
                
                % include mutated gen Indexes
                mutatedChrom=cat(2,mutatedChrom,i);                 
                                
                %validate new pop
                mutatedPop(j,:)=ValidateChrom (x_blue,population(i,:)); 
                j=j+1;
            end
            
    end
    mutatedPop( all(~mutatedPop,2), : ) = []; %remove zero rows from mutatedPop matrix

end