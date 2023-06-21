clear all;
close all;
clc;
tic

image = im2double(imread('images\low-light.jpg'));%original low-light image
figure, imshow(image),title('original low-light image');%figure1 original low-light image

%Separate R, G, B three channels
R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);

[r,c]=size(R);

%choose the max value among three channels
for m=1:r
    for n=1:c      
        a=max([R(m,n),G(m,n),B(m,n)]);
        T(m,n)=a;
    end
end
T;
figure,imshow(T)%figure2 grayscale image
% imwrite(T,'T_light.jpg');

%filter grayscale image
% im = im2double(T);
% [rows, cols] = size(im);
% im1 = im;
% im2 = zeros(rows, cols);
% N = 50; % number of iterations
% K=100;
% for k = 1 : N % iterations
%   for x = 2 : rows - 1
%     for y = 2 : cols - 1 % for each inner pixel
%      w0=0;
%       for i = -1 : 1  
%         for j = -1 : 1
%           w=exp(-K*abs(im1(x,y)-im1(x+i,y+j)));
%          im2(x,y) = im2(x,y) + im1(x+i,y+j)*w;
%          w0=w0+w;
%         end 
%       end
%       
%       im2(x,y) = im2(x,y)./w0;
%       
%     end
%   end
%   im1 = im2;
%   im2 = zeros(rows, cols);
% end
% figure, imshow(im1),title('N=50,k=100');%figure3 filtered image U

%enhanced image
im1 = im2double(imread('seagull_guided.jpg'));%image filtered by guided filter
eps=0.1;
E = image./(im1+eps);
figure, imshow(E);%enhanced image
toc