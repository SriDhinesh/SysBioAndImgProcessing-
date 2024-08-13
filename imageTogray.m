function [grayImage]= imageTogray(image)
%r - red, g - green , b- blue channel
r=image(:,:,1);
g=image(:,:,2);
b=image(:,:,3);
grayImage= 0.299*r + 0.587*g + 0.114*b;
imshow(grayImage)
end