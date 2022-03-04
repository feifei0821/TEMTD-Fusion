% example: detail enhancement
% figure 6 in our paper

close all;

[imagename1 imagepath1]=uigetfile('source_images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
I=imread(strcat(imagepath1,imagename1)); 
I=double(I);
p = I;

r = 16;
eps = 0.1^2;

q = zeros(size(I));

q(:, :, 1) = guidedfilter(I(:, :, 1), p(:, :, 1), r, eps);
q(:, :, 2) = guidedfilter(I(:, :, 2), p(:, :, 2), r, eps);
q(:, :, 3) = guidedfilter(I(:, :, 3), p(:, :, 3), r, eps);

I_enhanced = (I - q) * 5 + q;

figure();
imshow([uint8(I), q, I_enhanced], [0, 255]);
