clear all; close all; clc;

% ��ȡͼ��ת��Ϊ����������
I = im2double(imread('tulips.bmp'));

% ��������ͼ��
P = rgb2gray(I);

% ��������ͼ����ݶ�
[Px Py] = imgradientxy(P, 'sobel');
% Py = imgradientxy(P, 'sobel','y');

% ����ƽ���������ͼ����ݶ�
r = 5;
eps = 0.1^2;
P_mean = imguidedfilter(P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);
Pgx = imguidedfilter(Px, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);
Pgy = imguidedfilter(Py, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);

% ����ƽ�����ԭʼͼ����ݶ�
I_mean = imguidedfilter(I, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);
Igx = imguidedfilter(Px, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);
Igy = imguidedfilter(Py, P, 'NeighborhoodSize', r, 'DegreeOfSmoothing', eps);

% �����񻯺��ͼ��
I_sharp = I + (I - I_mean) ./ (P_mean - P) + (Igx.*Pgx + Igy.*Py) ./ (Pgx.^2 + Pgy.^2 + eps);

% ��ʾ���
subplot(1,2,1), imshow(I), title('Original');
subplot(1,2,2), imshow(I_sharp), title('Sharpened');
