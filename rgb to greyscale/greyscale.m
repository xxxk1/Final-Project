clear all; close all; clc

tic
RGB = imread('mo_GVWA.jpg');
figure,imshow(RGB)

I = rgb2gray(RGB);
figure,imshow(I)
imwrite(I,'mo_GVWA_greyscale.jpg');
toc