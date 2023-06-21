clear all; close all; clc;

% 读取图像并加入噪声
I = im2double(imread('cat.bmp'));
I_noisy = imnoise(I, 'gaussian', 0, 0.01);

% 设置guided filter参数
r = 5; % 滤波器窗口大小
eps = 0.01^2; % 正则化参数

% 用guided filter进行降噪
I_denoised = imguidedfilter(I_noisy, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);

% 计算图像的纹理
v = I_noisy - I_denoised;
% figure, imshow(v);

% 利用拉普拉斯算子进行高通滤波
v_lap = del2(v);
figure, imshow(v_lap);

% 设置参数alpha和beta
alpha = 0.5;
beta = 1.5;

% 计算增强后的高频信息
v_enhanced = alpha * v_lap;

% 计算结构信息
u = I_denoised - beta * v_enhanced;

% 计算锐化后的图像
I_sharp = u + v_enhanced;

% 显示结果
figure;
subplot(1,3,1), imshow(I_noisy), title('Noisy Image');
subplot(1,3,2), imshow(I_denoised), title('Denoised Image');
subplot(1,3,3), imshow(I_sharp), title('Sharpened Image');
