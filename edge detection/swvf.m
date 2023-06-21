clear all; close all;
tic

%% SWVF
a = imread('seagull.jpg');
image = im2double(a);

[A, result] = svf(double(a)/255.0, 6, 0.05);
% imwrite(result,'s.jpg');

%% rgb
RGB = result;
I1 = rgb2gray(RGB);
% imwrite(I1,'sg.jpg');
%% edge
guided = im2uint8(I1);
I = double(guided)/255;
C = canny_edge_detection(I, 2, 0.01, 0.065);
figure,imshow(C);
A = 1 - C;
figure,imshow(A);
% imwrite(A,'wsf.jpg');

toc
disp( ['运行时间: ',num2str(toc) ] );