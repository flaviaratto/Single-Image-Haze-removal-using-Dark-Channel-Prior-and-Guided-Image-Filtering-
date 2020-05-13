function J_DARK = Dark_Channel(hazy_image)
%Estimating Dark Channel Prior
%This is the function that is created to give us J_DARK which is the dark channel for the hazy image

[r,c,m] = size(hazy_image);   %Size of hazy image
P_S = 15;    %Patch Size 15X15
p = floor((P_S-1)/2);   %For padding
hazy_image_padded= padarray(hazy_image,[p,p],'replicate','both'); 

J_DARK = zeros(r,c);    %Size of dark channel image - initializing

for i=1:r
    for j=1:c
        local_patch = hazy_image_padded(i:i+P_S-1,j:j+P_S-1,1:m); %Setting a patch
        for k=1:m
            y=local_patch(:,:,k);
            minimum_c(1,k) = min(min(y));  %Minimum in the patch for each channel
        end
        J_DARK(i,j)=min(minimum_c); %Minimum of the whole patch
    end
end     