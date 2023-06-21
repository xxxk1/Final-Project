clear all; close all; clc;

%% PSNR
% X= imread('lime\images\30.jpg');
% Y= imread('lime\enhanced_30_sub.png');
% psnr(X, Y)


%% MSE
X= imread('lime\images\30.jpg');
Y= imread('lime\enhanced_30_sub.png');
err1 = immse(X,Y)



%% SSIM
% X= imread('lime\images\30.jpg');
% Y= imread('lime\enhanced_30_guided.jpg'); 
% s = ssim(X, Y)