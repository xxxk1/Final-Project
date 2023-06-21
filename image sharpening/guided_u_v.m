clear all; close all; clc;

% 读取图像
I = imread('cat.png');

% 提取结构信息
J = imguidedfilter(I, I, 5, 0.1);

% 提取纹理信息
T = I - J;

% 增强结构信息和纹理信息的对比度
J = imadjust(J, [0 1], [0.1 0.9]);
T = imadjust(T, [0 1], [0.1 0.9]);

% 显示结果
figure;
subplot(2, 2, 1);
imshow(I);
title('输入图像');
subplot(2, 2, 2);
imshow(J);
title('结构信息');
subplot(2, 2, 3);
imshow(T);
title('纹理信息');
subplot(2, 2, 4);
imshow(J + T);
title('结构信息和纹理信息');
