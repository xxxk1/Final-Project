clear all; close all;

tic

%% Kuwahara
I = imread('seagull.jpg');

radiuses = 2;%subwindow:17X17
             %neighbourhoods:9X9



r = radiuses;
J = kuwaharafilt(I, r);
% imwrite(J,'k.jpg');

%% rgb
RGB = J;
I1 = rgb2gray(RGB);
% imwrite(I1,'kg.jpg');

%% edge
guided = im2uint8(I1);
I = double(guided)/255;
C = canny_edge_detection(I, 2, 0.01, 0.065);
figure,imshow(C);
A = 1 - C;
figure,imshow(A);
% imwrite(A,'wkf.jpg');

toc

