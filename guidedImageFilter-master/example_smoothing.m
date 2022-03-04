% example: edge-preserving smoothing
% figure 1 in our paper

close all;

[imagename1 imagepath1]=uigetfile('source_images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
I=imread(strcat(imagepath1,imagename1)); 
I=double(rgb2gray(I))/255;
p = I;
r = 4; % try r=2, 4, or 8
eps = 0.2^2; % try eps=0.1^2, 0.2^2, 0.4^2

q = guidedfilter(I, p, r, eps);

figure();
imshow([uint8(I), uint8(q)], [0, 1]);
