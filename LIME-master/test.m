clear all;
close all;
clc;

tic
img_in = imread('imgs\denoised_3.jpg'); 

%% enhanced_noisy
% img_out = lime_main_module(img_in, 0.8, 1.07,0.1,1, 1);

%% guided
% img_out = lime_main_module_guided(img_in, 0.8, 1.07, 1);

%% GVWA
% img_out = lime_main_module_GVWA(img_in, 0.8, 1.07, 1);
% 
%% kuwahra
% img_out = lime_main_module_kuwahara_new(img_in, 0.8, 1.07, 1);
% 

%% sub
img_out = lime_main_module_sub(img_in, 0.8, 1.07, 1);


toc