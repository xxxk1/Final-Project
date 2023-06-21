clear all; close all; clc;

% 读取图像并转换为浮点数类型
I = im2double(imread('tulips.bmp'));

% 构造引导图像
P = rgb2gray(I);

% 计算引导图像的梯度
[Px Py] = imgradientxy(P, 'sobel');
% Py = imgradientxy(P, 'sobel','y');

% 计算平滑后的引导图像和梯度
r = 5;
eps = 0.1^2;
P_mean = imguidedfilter(P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);
Pgx = imguidedfilter(Px, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);
Pgy = imguidedfilter(Py, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);

% 计算平滑后的原始图像和梯度
I_mean = imguidedfilter(I, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);
Igx = imguidedfilter(Px, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);
Igy = imguidedfilter(Py, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);

% 计算锐化后的图像
I_sharp = I + (I - I_mean) ./ (P_mean - P) + (Igx.*Pgx + Igy.*Py) ./ (Pgx.^2 + Pgy.^2 + eps);

% 显示结果
subplot(1,2,1), imshow(I), title('Original');
subplot(1,2,2), imshow(I_sharp), title('Sharpened');
