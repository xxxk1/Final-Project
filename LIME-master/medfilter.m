clear all; close all; clc;

% 读入图像
img = imread('imgs\3.jpg');

% 添加椒盐噪声
% noisy_img = imnoise(img, 'salt & pepper', 0.02);

% 设置中值滤波器的参数
window_size = 3;  % 滤波器大小

% 应用中值滤波器
filtered_img = medfilt3(img, [window_size, window_size,window_size]);

% 显示结果
figure; imshow(img);
% subplot(1, 3, 2); imshow(noisy_img); title('加噪图像');
figure; imshow(filtered_img);
imwrite(filtered_img,'imgs\denoised_3.jpg');
