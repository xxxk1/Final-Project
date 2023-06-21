clear all; close all; clc;

% ��ȡͼ�񲢼�������
I = im2double(imread('cat.bmp'));
I_noisy = imnoise(I, 'gaussian', 0, 0.01);

% ����guided filter����
r = 5; % �˲������ڴ�С
eps = 0.01^2; % ���򻯲���

% ��guided filter���н���
I_denoised = imguidedfilter(I_noisy, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);

% ����ͼ�������
v = I_noisy - I_denoised;
% figure, imshow(v);

% ����������˹���ӽ��и�ͨ�˲�
v_lap = del2(v);
figure, imshow(v_lap);

% ���ò���alpha��beta
alpha = 0.5;
beta = 1.5;

% ������ǿ��ĸ�Ƶ��Ϣ
v_enhanced = alpha * v_lap;

% ����ṹ��Ϣ
u = I_denoised - beta * v_enhanced;

% �����񻯺��ͼ��
I_sharp = u + v_enhanced;

% ��ʾ���
figure;
subplot(1,3,1), imshow(I_noisy), title('Noisy Image');
subplot(1,3,2), imshow(I_denoised), title('Denoised Image');
subplot(1,3,3), imshow(I_sharp), title('Sharpened Image');
