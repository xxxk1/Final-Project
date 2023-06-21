clear all;
close all;
clc;
tic
image = im2double(imread('tree.jpg'));
% figure, imshow(image),title('original low-light image');%figure1 original low-light image

%Separate R, G, B three channels
R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);

[r,c]=size(R);

%% choose the max value among three channels --- T
for m=1:r
    for n=1:c      
        a=max([R(m,n),G(m,n),B(m,n)]);
        T(m,n)=a;
    end
end
T;
% figure,imshow(T)%figure2 grayscale image
% imwrite(T,'T_tree.jpg');

%% guided filter --- U
% I = double(imread('T_30.jpg')) / 255;
I = T;
% figure,imshow(I);

p = I;

r = 16;
eps = 0.1^2;

q = zeros(size(I));

q(:, :) = guidedfilter(I(:, :), p(:, :), r, eps);
% q(:, :, 1) = guidedfilter(I(:, :, 1), p(:, :, 1), r, eps);
% q(:, :, 2) = guidedfilter(I(:, :, 2), p(:, :, 2), r, eps);
% q(:, :, 3) = guidedfilter(I(:, :, 3), p(:, :, 3), r, eps);

I_enhanced = (I - q) * 5 + q;

% figure(),
% imshow([I, q, I_enhanced], [0, 1]);
% imshow(q);
%% enhanced image --- E
% im1 = im2double(imread('U_tree_guided.jpg'));
im1 = im2double(q);
eps=0.1;
E = image./(im1+eps);
figure, imshow(E);%title('enhanced image (N=50,k=100,eps=0.1)'); %figure4 enhanced image
% imwrite(E,'enhanced_tree_guided.jpg');
toc