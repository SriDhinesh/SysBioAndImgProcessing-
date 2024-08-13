function [zImage1,zImage2,zImage3] = zextract(data)

totalPlaneCount=size(data{1,1},1);
no_of_channel=input("Enter the number of channel in the confocal image:");
eachChanlPlaneCount= totalPlaneCount/no_of_channel;
zImage1=zeros(1024,1024,eachChanlPlaneCount);
zImage1= uint16(zImage1);
zImage2=zeros(1024,1024,eachChanlPlaneCount);
zImage2= uint16(zImage2);
zImage3=zeros(1024,1024,eachChanlPlaneCount);
zImage3= uint16(zImage3);

indexImg1= 1:no_of_channel:totalPlaneCount ;
indexImg2= 2:no_of_channel:totalPlaneCount ;
indexImg3= 3:no_of_channel:totalPlaneCount ;

for i=1:eachChanlPlaneCount

    a=data{1,1}{indexImg1(i),1};
    b=data{1,1}{indexImg2(i),1};
    c=data{1,1}{indexImg3(i),1};
    zImage1(:,:,i)=a;
    zImage2(:,:,i)=b;
    zImage3(:,:,i)=c;
end

end