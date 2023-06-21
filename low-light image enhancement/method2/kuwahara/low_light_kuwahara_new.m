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

%% GVWA --- U
I = im2double(T);

radiuses = 2;%subwindow:17X17
             %neighbourhoods:9X9
r = radiuses;
J = kuwaharafilt(I, r);
% figure,imshow(J);
% imwrite(J,'filtered.jpg');

%% enhanced image --- E
im1 = im2double(J);
eps=0.1;
E = image./(im1+eps);
figure, imshow(E);
toc