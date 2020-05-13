clc;
clear all;

hazy_image=imread("Haze_Singapore.jpg");
[r,c,m]=size(hazy_image);
subplot(2,3,1)
imshow(hazy_image)
title("Hazy Image - Input")

%Finding Dark Channel
hazy_image=double(hazy_image);
hazy_image=hazy_image./255;
J_DARK = Dark_Channel(hazy_image);
subplot(2,3,2)
imshow(J_DARK)
title("Dark Channel")

%Finding Atmospheric Light
A = Estimating_Atmospheric_Light(hazy_image,J_DARK);

%Finding Transmission
t=Transmission_Estimate(hazy_image,A);
subplot(2,3,3)
imshow(t)
title("Transmission Estimate")

%Finding Haze-Free Image
J=Recovering_Scene_Radiance(hazy_image,A,t);
J=J.*255;
subplot(2,3,4)
imshow(uint8(J))
title("Recovered Image")

%Finding Refined Transmission using Guided Filter
window_size=75;
FG=Guided_Filter(t,hazy_image,window_size);
subplot(2,3,5)
imshow(FG)
title("Refined Transmission Estimate using Guided Filter")

%Finding Refined Haze-Free Image
J_Refined=Recovering_Scene_Radiance(hazy_image,A,FG);
J_Refined=J_Refined.*255;
subplot(2,3,6)
imshow(uint8(J_Refined))
title("Refined Image")

