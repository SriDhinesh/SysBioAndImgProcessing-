%% for whole nucleus plane

zImage1dbl=double(zImage1);
zImage1norm=zImage1dbl/max(zImage1dbl,[],"all");

[~,~,zPlanes]=size(zImage1norm);
bw=zeros(size(zImage1norm));

for i=1:zPlanes
    binarized=imbinarize(zImage1norm(:,:,i));
    bw(:,:,i)=binarized;
end

%connected component based segmentation, storing the op in differnt matrix. As well as 3D based hole filling is happening here

img=bw;
imgProcessed=zeros(size(img));
for k = 2 : [size(img,3)-1]
   for i = 2 : [size(img,1)-1]
     for j = 2 : [size(img,2)-1]
        %6 connected component based
        % if sum([img(i,j,k),img(i-1,j,k),img(i+1,j,k),img(i,j-1,k),img(i,j+1,k),img(i,j,k-1),img(i,j,k+1)],'all')==7
        %   imgProcessed(i,j,k)=1;
        % end
        
        %26 connected component based
        index27conn= [img(i,j,k),img(i,j,k-1),img(i,j,k+1),img(i-1,j,k),img(i-1,j,k-1),img(i-1,j,k+1),img(i+1,j,k),img(i+1,j,k-1),img(i+1,j,k+1),img(i,j-1,k),img(i,j-1,k-1),img(i,j-1,k+1),img(i,j+1,k),img(i,j+1,k-1),img(i,j+1,k+1),img(i-1,j-1,k),img(i-1,j-1,k-1),img(i-1,j-1,k+1),img(i-1,j+1,k),img(i-1,j+1,k-1),img(i-1,j+1,k+1),img(i+1,j-1,k),img(i+1,j-1,k-1),img(i+1,j-1,k+1),img(i+1,j+1,k),img(i+1,j+1,k-1),img(i+1,j+1,k+1)];
        if sum(index27conn,'all') >= 20
           imgProcessed(i,j,k)=1;
        end

     end
   end
end