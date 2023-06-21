close all;
close all;
clc;

tic

I = double(imread('images\beach.png')) / 255;%original image
% figure,imshow(I);
% imwrite(I,'enhanced_tree.jpg');

p = I;

r = 16;
eps = 0.1^2;

u = zeros(size(I));

% u(:, :) = guidedfilter(I(:, :), p(:, :), r, eps);
u(:, :, 1) = guidedfilter(I(:, :, 1), p(:, :, 1), r, eps);
u(:, :, 2) = guidedfilter(I(:, :, 2), p(:, :, 2), r, eps);
u(:, :, 3) = guidedfilter(I(:, :, 3), p(:, :, 3), r, eps);

T = I - u;%texture
sharpening_T = T* 2 + u;%add ahrpening coefficients on texture
% sharpening_u = 1.2*u + T;%add ahrpening coefficients on structure
% sharpening_a = 1.2*u + 2*T;%add ahrpening coefficients on both texture
% and texture

% figure,imshow(u);%show structure
% figure,imshow(T);%show texture

figure,imshow(sharpening_T);%sharpened image by adding coefficient on texture
% figure,imshow(sharpening_u);%sharpened image by adding coefficient on
% structure
% figure,imshow(sharpening_a);%sharpened image by adding coefficient on
% both texture and structure

toc
disp( ['运行时间: ',num2str(toc) ] );