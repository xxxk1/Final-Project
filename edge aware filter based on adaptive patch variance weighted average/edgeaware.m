close all
clear all
tic
i  = imread('seagull.jpg');%original image
i = im2double(i);


J =i;

iter = 10;
SigmaS = 0.75;
scale = 0.25;


for n=1 : iter
    J = GVWA(J,i,SigmaS,scale);
end 

% T = i - J;%texture

figure,imshow(J);%filtered image

toc
disp( ['Time: ',num2str(toc) ] );