blueX= [1,1,10,10,5,5];
blueY = [1,11,1,10,8,0];
redX = [7,2,12,3];
redY = [12,2,12,3];
chrom = randperm(6,6);
% chrom = [5,2,4,6,3,1]; %fake chrom
RealCordinates = BuildRealCordinates(chrom,blueX,blueY); %
ChromCorX = RealCordinates(1,:); %split X valuse
ChromCorY = RealCordinates(2,:); % split y values

VertexIndex = chrom(1);
% VertexX = ChromCorX(1);
% VertexY = ChromCorY(1);
VertexX =mean(ChromCorX);
VertexY =mean(ChromCorY);
SeqX = ChromCorX(2:end);
SeqY = ChromCorY(2:end);

% SeqX = ChromCorX(2:end);
% SeqY = ChromCorY(2:end);

% cos = [];
% 
% for i=1:length(SeqY)
%     Vatar(1,i)= sqrt((SeqY(1,i)-VertexY)*(SeqY(1,i)-VertexY)+ (SeqX(1,i)-VertexX)*(SeqX(1,i)-VertexX));
%     Cos(1,i) = SeqX(1,i)/Vatar(1,i);
%     anglesCos = acos(Cos);
% end
% angles=anglesCos;

angles = atan2d((SeqY-VertexY) , (SeqX-VertexX));
[sortedAngles, sortIndexes] = sort(angles);

SortedSeqPointsX = SeqX(sortIndexes);  % Reorder x and y with the new sort order.
SortedSeqPointsY  = SeqY(sortIndexes);


% SortedRealPointsX = cat(2,VertexX,SortedSeqPointsX);
% SortedRealPointsY = cat(2,VertexY,SortedSeqPointsY);
SortedRealPointsX=SortedSeqPointsX;
SortedRealPointsY=SortedSeqPointsY;
%plot(SortedRealPointsX,SortedRealPointsY);


%-------------------------check minus
pgon3 = polyshape(SortedRealPointsX,SortedRealPointsY);

% if pgon3.NumRegions >=2
%     flag=0;
%         for i=1:length(angles)
%             if angles(1,i)>-1
%                 flag=flag+1;
%                  angles(1,i) = (angles(1,i) - 360);
%             end
%         end
%     [sortedAngles, sortIndexes] = sort(angles);
%     SortedSeqPointsX = SeqX(sortIndexes);  % Reorder x and y with the new sort order.
%     SortedSeqPointsY  = SeqY(sortIndexes);
%     SortedRealPointsX = cat(2,VertexX,SortedSeqPointsX);
%     SortedRealPointsY = cat(2,VertexY,SortedSeqPointsY);
%     
% end
%--------------------------------------------------------

hold on



plot(pgon3);

hold on
plot (redX,redY,'*','color','red');
plot (VertexX,VertexY, 'rO')