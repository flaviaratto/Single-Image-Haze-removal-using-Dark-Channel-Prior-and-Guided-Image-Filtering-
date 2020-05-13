# Single-Image-Haze-removal-using-Dark-Channel-Prior-and-Guided-Image-Filtering-
A MATLAB implementation of the algorithm described in the paper by He et al. titled "Single Image Haze Removal using Dark Channel Prior" [1] for haze removal from a single image (RGB and Grayscale). The results from the previous method were refined using the approach described in the paper by the same authors He et al. titled "Guided Image Filtering" [2] for removing any artifacts present in the recovered image.

This was completed as a part of the final project titled **Morning View Mode** for Fall 2019 ECEN642 Digital Image Processing course at Texas A&M University.

## Block Diagram for Implementation- ##
<img src="https://user-images.githubusercontent.com/65198491/81782258-2cd45a00-94bf-11ea-804a-af107c80584a.png" width=50%>

## Steps to execute- ##
1. The input hazy images are in the zipped folder - Image_Set --> Input_Hazy_Images. Please move the image that you want to test for in the folder containing the program files. 
2. The main function to be executed is the file with the name as "MorningViewMode". Please run that function in Matlab. 
3. The output will contain the recovered haze free image and the refined result.

**Note-** The results are present in the zipped folder Image_Set --> Results.

## Experimental Results- ##
* RGB image
<img src="https://user-images.githubusercontent.com/65198491/81784238-2d222480-94c2-11ea-82b4-aa7b9b1bd6f8.png">

* Grayscale image
<img src="https://user-images.githubusercontent.com/65198491/81784348-5773e200-94c2-11ea-96cd-9e9928368788.png">

## References- ##
[1] HE ET AL.: SINGLE IMAGE HAZE REMOVAL USING DARK CHANNEL PRIOR, IEEE TRANSACTIONS ON PATTERN ANALYSIS AND MACHINE INTELLIGENCE, VOL. 33, NO. 12, DECEMBER 2011. <br/>
[2] HE ET AL.: GUIDED IMAGE FILTERING, IEEE TRANSACTIONS ON PATTERN ANALYSIS AND MACHINE INTELLIGENCE, VOL. 35, NO. X, XXXXXXX 2013. 
