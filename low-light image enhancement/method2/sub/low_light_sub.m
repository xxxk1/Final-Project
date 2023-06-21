%Assignment 1 Task2
clear all;
close all;
clc;
tic

% image = im2double(imread('D:/SE_m/assignment1/images/low_light/8.bmp'));
% image = im2double(imread('D:/SE_m/assignment1/images/low_light/10.bmp'));
% image = im2double(imread('D:/SE_m/assignment1/images/low_light/30.jpg'));
% image = im2double(imread('D:/SE_m/assignment1/images/low_light/samsung_galaxy.jpg'));
image = im2double(imread('D:/BEng_4_th_year/low-light image enhancement/lime/images/tree.jpg'));
figure, imshow(image),title('original low-light image');%figure1 original low-light image

%Separate R, G, B three channels
R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);

[r,c]=size(R);

%choose the max value among three channels
for m=1:r
    for n=1:c      
        a=max([R(m,n),G(m,n),B(m,n)]);
        T(m,n)=a;
    end
end
T;
figure,imshow(T)%figure2 grayscale image
% imwrite(T,'T_light.jpg');

[A, result] = svf(double(imread('T_tree.jpg'))/255.0, 3, 0.025);
imshow(result);%U

%enhanced image
im1 = im2double(imread('U_light_sub.jpg'));
eps=0.1;
E = image./(im1+eps);
figure, imshow(E);%title('enhanced image (N=50,k=100,eps=0.1)'); %figure4 enhanced image
% imwrite(E,'enhanced_tree_guided.jpg');
toc