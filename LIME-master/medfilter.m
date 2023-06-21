clear all; close all; clc;

% ����ͼ��
img = imread('imgs\3.jpg');

% ��ӽ�������
% noisy_img = imnoise(img, 'salt & pepper', 0.02);

% ������ֵ�˲����Ĳ���
window_size = 3;  % �˲�����С

% Ӧ����ֵ�˲���
filtered_img = medfilt3(img, [window_size, window_size,window_size]);

% ��ʾ���
figure; imshow(img);
% subplot(1, 3, 2); imshow(noisy_img); title('����ͼ��');
figure; imshow(filtered_img);
imwrite(filtered_img,'imgs\denoised_3.jpg');
