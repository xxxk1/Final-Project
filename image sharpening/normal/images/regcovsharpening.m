clear all; close all;clc;

T = im2double(imread('images\cat_regcov_t.jpg'));
U = im2double(imread('images\cat_regcov_u.jpg'));
sharpening_T = U+ 2*T;
figure,imshow(sharpening_T);
