 function ValidChrom = ValidateChrom (x_blue,child) 
 % this function generate an chrom without duplicate gen
 % at first the last Gen (break point) must be splited
 
  %child = [1,2,5,2,3,1,6,8,9,12]; %fake chrom
  %x_blue = [1,1,10,10,5,5,8,9,8,4,4];
  chromCore = child(1:end-2);                       % split Break Point and Real Length
  [C,uniqID,ic] = unique(chromCore,'first','legacy');   % find uniqe points and theirs indixes
  MaxSize = length (x_blue);                        % max size of chrom
  PointsSet =randperm(MaxSize,MaxSize);             % generate set of valid points indexes
                                                    % scan all genes of the
                                                    % chromosome                                          
  for i=1:MaxSize                                   % it has an little bias, it tries to save first items and replace last items
      if  ~ismember (i,uniqID)                      % find duplicate points in chrom | not in uniqID
          for j=1:MaxSize
             if ~ismember (PointsSet(j),chromCore)      % find new points from points set | not in chrom
                 chromCore(i)=PointsSet(j);             % replace new poinnts
             end
          end
      end          
  end
  
  ValidChrom = cat ( 2, chromCore , child(end-1));  % append break point to the validated chrom
  ValidChrom = cat ( 2, ValidChrom , child(end));   % append RealLenght
  
 end