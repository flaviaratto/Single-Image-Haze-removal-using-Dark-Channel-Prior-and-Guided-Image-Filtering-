function A = Estimating_Atmospheric_Light(hazy_image,J_DARK)
%Estimating Atmospheric Light
%This function is used to estimate the atmospheric light
%This is done by picking the top 0.1% brightest pixels in the dark channel
%Among these pixels, the pixels with the highest intensity in the input hazy image is selected as the atmospheric light

[r,c,m]=size(hazy_image);
prod=r*c;
size_im=floor((0.1/100)*(prod));    %For 0.1% brightest pixels

J_DARK_RESHAPED = reshape(J_DARK,prod,1);
hazy_image_RESHAPED = reshape(hazy_image,prod,m);

[J_DARK_RESHAPED, I] = sort(J_DARK_RESHAPED,'descend'); %Sorting in descending order

%B_P=J_DARK_RESHAPED(1);
IM_location=I(1);   %Location of brightest pixel in the input hazy image
for k = 1:m
    A(k)=hazy_image_RESHAPED(IM_location,k);
end

