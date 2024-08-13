function [pixelValues, frequency, normFrequency]=image_Hist(image)
%input only 8bit image
image= imageTogray(image);
pixelValues=0:255;
pixelValues=pixelValues';
[M,N]=size(image);
for i = 0:255
    count = 0;
    for m= 1:M
        for n= 1:N
            if image(m,n)== i
                count=count+1;
            end
        end
    end
    frequency(i+1)=count;
end
frequency=frequency';
normFrequency=frequency/(M*N);
end 