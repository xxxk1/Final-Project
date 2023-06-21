clear all;
close all;
clc;
tic
image = im2double(imread('30.jpg'));
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

%% sub --- U
[A, result] = svf(T, 3, 0.025);
% figure,imshow(result);%U

%% enhanced image --- E
% im1 = im2double(imread('U_tree_sub.jpg'));
im1 = im2double(result);
eps=0.1;
E = image./(im1+eps);
figure, imshow(E);%title('enhanced image (N=50,k=100,eps=0.1)'); %figure4 enhanced image
% imwrite(E,'enhanced_tree_guided.jpg');
toc