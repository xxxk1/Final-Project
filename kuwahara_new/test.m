clear all; close all; clc;

tic

I = imread('44.png');
% figure,imshow(I);
gray = rgb2gray(I);

radiuses = 4;%subwindow:17X17
             %neighbourhoods:9X9

% figure;
% imshow(I);
% title('Original');

r = radiuses;
J = kuwaharafilt(I, r);
figure,imshow(J);
% imwrite(J,'results\44.png');

% imshow(gray);
% imwrite(gray,'gray.jpg');
% r = radiuses;
% J = kuwaharafilt(gray, r);
% imshow(J);
% imwrite(J,'gray_filtered.jpg');
toc

