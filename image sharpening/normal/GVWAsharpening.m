close all
clear all
tic
i  = imread('images\beach.png');
i = im2double(i);
% figure,imshow(i)

u =i;

iter = 10;
SigmaS = 2;
scale = 0.25;


for n=1 : iter
    u = GVWA(u,i,SigmaS,scale);
end 

T = i - u;
% figure,imshow(T);
% imwrite(T,'cat_GVWA_t.png');
%imshow([i, J]);
% figure,imshow(u);
% imwrite(u,'cat_GVWA_u.png');
% imwrite(J,'enhanced_tree_GVWA.jpg');

sharpening_T = u + 2*T;
figure,imshow(sharpening_T);
% imwrite(sharpening_T,'results\forest_t_GVWA.png');

% sharpening_u = T + 1.2*u;
% figure,imshow(sharpening_u);
% imwrite(sharpening_u,'results\forest_u_GVWA.png');
% 
% sharpening_a = 2*T + 1.2*u;
% figure,imshow(sharpening_a);
% imwrite(sharpening_a,'results\forest_a_GVWA.png');

toc
disp( ['运行时间: ',num2str(toc) ] );