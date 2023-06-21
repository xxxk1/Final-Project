clear all; close all; clc;

original = imread('images\cat.png');
figure,imshow(original);

src=imread('images\cat_GVWA_t.png');%对u还是v进行增强
% figure;imshow(src), title('原图');
Radius=5;
[ dest ] = multiScaleSharpen( src, Radius);
% figure;imshow(dest), title('dest');

u = imread('images\cat_GVWA_u.png');
sharpening = u + 3*dest;
figure,imshow(sharpening);


% v = imread('images\cat_GVWA_t.png');
% sharpening = v + 15*dest;
% figure,imshow(sharpening);
