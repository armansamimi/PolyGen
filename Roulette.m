function selectedChromMatrix = Roulette(fitness,NoSelectedChrom)
    %popSize=50;
    %NoSelectedChrom = 10; %fake
    %fitness = randi(popSize,10,1);     % fake pop
    selectedChromMatrix = [];
    MaxSize = length(fitness);
    CumFit = zeros(MaxSize,1);          %Cumulative fitness function
    CumFit(1)= fitness(1);              % first 
    
    for i=2:MaxSize
        CumFit(i) = CumFit(i-1) + fitness(i);   %calculate each Cumulative fitness tunction
    end
    maxCum = max(CumFit);                       %the Largest Cumulative fitness function
    
    
    for j=1:NoSelectedChrom                     % select N chrom based on CumFit for survive | N = NoSelectedChrom 
        pointer=rand()*maxCum;                  % generate random pointer
        for k=1:MaxSize
            if CumFit(k) > pointer              % if the CumFit is larger than the pointer the correspoinding chrom will be selected
               selectedChromMatrix=cat(2,selectedChromMatrix,k); % include selected chrom in selectedChromMatrix
               break
            end
        end
        
    end
   



end
  