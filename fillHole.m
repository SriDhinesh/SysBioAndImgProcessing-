function [holeFilledPlane]=fillHole(image,cnn)
%cnn is the minimum number of pixel in the 8 connected pixels to be in 1

% Set default value for cnn if not provided
    if nargin < 2
        cnn = 4;
    end

[m, n]=size(image);
for i=2:m-1
    for j=2:n-1
       if image(i,j) == 0 %the pixel is black in colour
           positions={[i-1,j-1],[i-1,j],[i-1,j+1],[i,j-1],[i,j+1],[i+1,j-1],[i+1,j],[i+1,j+1]}; 
           comparisionResult=size(positions);
           for k=1:numel(positions)
           row_index = positions{k}(1);
           col_index = positions{k}(2); 
           comparisionResult(k) = (image(row_index, col_index) == 1);
           end
           if sum(comparisionResult) >=cnn
           image(i,j)= 1;
           end
       else
           image(i,j)=image(i,j);
       end
    end
end
holeFilledPlane=image;
end