function chromosome = InjectChrom (x_blue,y_blue,chrom_len)
    % this function generation a random chromosome for injection in
    % population
    

    chromCore = randperm(chrom_len-2,chrom_len-2);
    SortedPoint = SortChrom(x_blue,y_blue,chromCore);
    BreakPoint = randi([4 chrom_len-5],1);          % genereate random break point for 2 polygon
    
    StartRL = max (BreakPoint+2 , chrom_len-5);
    RealLength = randi([StartRL chrom_len-2],1); %generate and Real Lenght means that an solution could include fewer Blue point not all of them
    
    
    %----------------------for version 2-----------------------
    % generate random start , scan from start point up to itsled like a
    % circle ( = start from randomStart to end and next from 1 to
    % randomStart-1)
    
    randomStart = randi([1 chrom_len-1],1);           
    if randomStart ==1
        SortedChromCore=SortedPoint;
    else
    part1=SortedPoint(randomStart:end);
    part2=SortedPoint(1:randomStart-1);
    SortedChromCore = cat(2,part1 ,part2)  ;
    
    end
    chromosome_tmp=cat(2,SortedChromCore,BreakPoint); % append break point to chromosome
    chromosome=cat(2,chromosome_tmp,RealLength);      % append RealLength to chromosome
    % ---------------------for version 2-----------------------
    
end