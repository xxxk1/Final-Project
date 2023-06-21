clear all; close all; clc;

% ��ȡͼ��
I = imread('cat.png');

% ��ȡ�ṹ��Ϣ
J = imguidedfilter(I, I, 5, 0.1);

% ��ȡ������Ϣ
T = I - J;

% ��ǿ�ṹ��Ϣ��������Ϣ�ĶԱȶ�
J = imadjust(J, [0 1], [0.1 0.9]);
T = imadjust(T, [0 1], [0.1 0.9]);

% ��ʾ���
figure;
subplot(2, 2, 1);
imshow(I);
title('����ͼ��');
subplot(2, 2, 2);
imshow(J);
title('�ṹ��Ϣ');
subplot(2, 2, 3);
imshow(T);
title('������Ϣ');
subplot(2, 2, 4);
imshow(J + T);
title('�ṹ��Ϣ��������Ϣ');
