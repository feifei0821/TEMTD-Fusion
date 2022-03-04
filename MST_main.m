clear all;
close all;
clc;

addpath(genpath('dtcwt_toolbox'));
addpath(genpath('fdct_wrapping_matlab'));
addpath(genpath('nsct_toolbox'));
addpath(genpath('evalution'));

% [imagename1 imagepath1]=uigetfile('source_images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
% image_input1=imread(strcat(imagepath1,imagename1));    
% [imagename2 imagepath2]=uigetfile('source_images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the second input image');
% image_input2=imread(strcat(imagepath2,imagename2));    

image_input1=imread('D:\工作目录\红外与可见光融合\近红外图像融合\results\sources\VIS\3.tiff');
image_input2=imread('D:\工作目录\红外与可见光融合\近红外图像融合\results\sources\NIR\3.tiff');
figure;imshow(image_input1);
figure;imshow(image_input2);

% if size(image_input1)~=size(image_input2)
%     error('two images are not the same size.');
% end

A=double(rgb2gray(image_input1));
B=double(image_input2);
% figure;imshow(A);
% figure;imshow(B);

level=2;

tic;

if size(A,3)==1    %for gray images
    F1 = lp_fuse(A, B, level, 1, 1);       %LP
%     F2 = rp_fuse(A, B, level, 3, 4);      %RP
%     F3 = dwt_fuse(A, B, level);           %DWT
%     F4 = dtcwt_fuse(A,B,level);           %DTCWT
%     F5 = curvelet_fuse(A,B,level+1);      %CVT
%     F6 = nsct_fuse(A,B,[2,3,3,4]);        %NSCT
else               %for color images
    F=zeros(size(A));
    for i=1:3
        F(:,:,i) = lp_fuse(A(:,:,i), B(:,:,i), level, 1, 4);       %LP
        %F(:,:,i) = rp_fuse(A(:,:,i), B(:,:,i), level, 3, 4);      %RP
        %F(:,:,i) = dwt_fuse(A(:,:,i), B(:,:,i), level);           %DWT
        %F(:,:,i) = dtcwt_fuse(A(:,:,i),B(:,:,i),level);           %DTCWT
        %F(:,:,i) = curvelet_fuse(A(:,:,i),B(:,:,i),level+1);      %CVT
        %F(:,:,i) = nsct_fuse(A(:,:,i),B(:,:,i),[2,3,3,4]);        %NSCT
    end
end
F(:,:,1)=F1;
% F(:,:,2)=F2;
% F(:,:,3)=F3;
% F(:,:,4)=F4;
% F(:,:,5)=F5;
% F(:,:,6)=F6;
toc;


figure;imshow([A uint8(F(:,:,1))]);
% 
% for i=1:6
%     EN(i)=en(uint8(F(:,:,i)));
%     MI(i)=mutinf(uint8(A),uint8(F(:,:,i)))+mutinf(uint8(B),uint8(F(:,:,i)));
%     SD(i)=variance(uint8(F(:,:,i)));
%     SF(i)=space_frequency(uint8(F(:,:,i)));
% end
% 
% EN(1)
% MI(1)
% SD(1)
% SF(1)
% figure;plot(EN,'r:+')
% figure;plot(MI,'r:+')
% figure;plot(SD,'r:+')
% figure;plot(SF,'r:+')


% imwrite(uint8(F),'C:\Users\li\Desktop\some figures\sjiyan.png');


