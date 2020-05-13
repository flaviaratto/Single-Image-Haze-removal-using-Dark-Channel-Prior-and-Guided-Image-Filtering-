function t = Transmission_Estimate(hazy_image,A)
%Function to estimate the transmission

[r,c,m]=size(hazy_image);
% [p,q]=size(A);

w=0.95;     %keeping a small amount of haze for distant objects

for i=1:r
    for j=1:c
        for k=1:m
            y(i,j,k)=hazy_image(i,j,k)/A(1,k);
        end
    end
end
Dark_Channel_y=Dark_Channel(y);
t=1-(w.*Dark_Channel_y);