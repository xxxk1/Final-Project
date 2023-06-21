close all
clear all
tic

%% GVWA
i  = imread('seagull.jpg');
i = im2double(i);

J =i;

iter = 10;
SigmaS = 0.75;
scale = 0.25;


for n=1 : iter
    J = GVWA(J,i,SigmaS,scale);
end 

% imwrite(J,'gv.jpg');
%% rgb
RGB = J;
I1 = rgb2gray(RGB);
% imwrite(I1,'gvg.jpg');

%% edge
guided = im2uint8(I1);
I = double(guided)/255;
C = canny_edge_detection(I, 2, 0.01, 0.065);
figure,imshow(C);
A = 1 - C;
figure,imshow(A);
% imwrite(A,'wgvwa.jpg');

toc
disp( ['运行时间: ',num2str(toc) ] );