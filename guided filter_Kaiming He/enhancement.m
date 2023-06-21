close all;
close all;
clc;

tic
I = double(imread('seagull.jpg')) / 255;
% figure,imshow(I);% show original image

p = I;

r = 8;
eps = 0.2^2;

q = zeros(size(I));

% q(:, :) = guidedfilter(I(:, :), p(:, :), r, eps);%grayscale image
q(:, :, 1) = guidedfilter(I(:, :, 1), p(:, :, 1), r, eps);%colour image 
q(:, :, 2) = guidedfilter(I(:, :, 2), p(:, :, 2), r, eps);
q(:, :, 3) = guidedfilter(I(:, :, 3), p(:, :, 3), r, eps);
figure,imshow(q);%filtered image

% T = I - q;% texture

toc
disp( ['Time: ',num2str(toc) ] );