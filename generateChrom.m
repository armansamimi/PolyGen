% function chromosome = generateChrom (x_blue,y_blue,chrom_len)             %for version 1  
function chromosome = generateChrom (x_blue,y_blue,x_red,y_red,chrom_len,SortedPoint)   %for version 2
    % generate uniqe integer num from 1 up to chrom_len-1

    BreakPoint = randi([4 chrom_len-5],1);          % genereate random break point for 2 polygon
    
    StartRL = max (BreakPoint+2 , chrom_len-5);
    RealLength = randi([StartRL chrom_len-2],1); %generate and Real Lenght means that an solution could include fewer Blue point not all of them
    
    
    %----------------------for version 2-----------------------
    % generate random start , scan from start point up to itsled like a
    % circle ( = start from randomStart to end and next from 1 to
    % randomStart-1)
    
    randomStart = randi([1 chrom_len-1],1);           
    if randomStart ==1
        RotatedChrome=SortedPoint;
    else
    part1=SortedPoint(randomStart:end);
    part2=SortedPoint(1:randomStart-1);
    

    RotatedChrome = cat(2,part1 ,part2)  ;
    
    end
    
    SortedPart1=SortChrom(x_blue,y_blue,RotatedChrome(1:BreakPoint));
    SortedPart2=SortChrom(x_blue,y_blue,RotatedChrome(BreakPoint+1:end));
    
    
%     sortedIndices = cat(2,SortedPart1,(SortedPart2 + BreakPoint)); % we transmit indicex to proper domain ( becasue we sort 2 part of chrom seperatley)
%     SortedChromCore = cat(2,SortedPart1,(SortedPart2 + BreakPoint)); % we transmit indicex to proper domain ( becasue we sort 2 part of chrom seperatley)
    SortedChromCore = cat(2,SortedPart1 ,SortedPart2)  ;
    
    chromosome_tmp=cat(2,SortedChromCore,BreakPoint); % append break point to chromosome
    chromosome=cat(2,chromosome_tmp,RealLength);      % append RealLength to chromosome
    
    
    chromRealLength = chromosome(1,end);            % best solution Real Length                  
    chromSolBrPoint = chromosome(1,end-1);
    ChromCore = chromosome(1,1:chromRealLength);
    PlotChromPolygon(ChromCore,chromSolBrPoint,x_blue,y_blue,x_red,y_red);
    x=2 ;


end