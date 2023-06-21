clear all;close all;clc;
tic

%% guided filter
I2 = double(imread('seagull.jpg')) / 255;
p = I2;

r = 8;
eps = 0.2^2;

q = zeros(size(I2));

% q(:, :) = guidedfilter(I(:, :), p(:, :), r, eps);
q(:, :, 1) = guidedfilter(I2(:, :, 1), p(:, :, 1), r, eps);
q(:, :, 2) = guidedfilter(I2(:, :, 2), p(:, :, 2), r, eps);
q(:, :, 3) = guidedfilter(I2(:, :, 3), p(:, :, 3), r, eps);
% imwrite(q,'g.jpg');


%% rgb
RGB = q;
I1 = rgb2gray(RGB);
% imwrite(I1,'gg.jpg');

%% edge
guided = im2uint8(I1);
I = double(guided)/255;
C = canny_edge_detection(I, 2, 0.01, 0.065);
figure,imshow(C);
A = 1 - C;
figure,imshow(A);
% imwrite(A,'wgf.jpg');
toc
