addpath(genpath('ext'));

I=imread('images/beach.png');
I = im2double(I);
%I=I(200:400,250:450,:);% about M1:60second % M2:70second % M3:60second
tic
S=regcovsmooth(I,10,6,0.1,'M1');
toc
T=I-S;

% figure,imshow(I);
% title('Input');

% figure,imshow(S);
% title('Structure');

% figure,imshow(T);
% title('Texture');

sharpening_T = S + 2*T;
figure,imshow(sharpening_T);
% imwrite(sharpening_T,'results\forest_t_reg.png');
% 
% sharpening_u = 1.2*S + T;
% figure,imshow(sharpening_u);
% imwrite(sharpening_u,'results\forest_u_reg.png');
% 
% sharpening_a = 1.2*S + 2*T;
% figure,imshow(sharpening_a);
% imwrite(sharpening_a,'results\forest_a_reg.png');

% save('texture0004.mat', 'T');
% save('structure0004.mat', 'S');