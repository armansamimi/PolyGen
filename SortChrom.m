function sortedChrom = SortChrom(x_blue,y_blue,ChromCore)

    RealCordinates = BuildRealCordinates(ChromCore,x_blue,y_blue); %
    ChromCorX = RealCordinates(1,:); % split X valuse
    ChromCorY = RealCordinates(2,:); % split y values

    VertexX = mean(ChromCorX);       % find a Vertex
    VertexY = mean(ChromCorY);

    SeqX = ChromCorX(1:end);         % assign to a valid sequence for sorting
    SeqY = ChromCorY(1:end); 

    angles = atan2d((SeqY-VertexY) , (SeqX-VertexX));   % sort points based on vertex
    [sortedAngles, sortIndexes] = sort(angles);         % assign best indexes ( =points = genes)


    sortedChrom = ChromCore(sortIndexes); % return sortIndexes ( = sortedChrom )   
%     XsortedCoordinated = RealCordinates(1,sortedChrom);
%     YsortedCoordinated = RealCordinates(2,sortedChrom);
%     plot(XsortedCoordinated,YsortedCoordinated)
    x=2;
end