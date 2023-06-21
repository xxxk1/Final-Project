tic
addpath(genpath('ext'));

I=imread('images/cat.png');%original image
I = im2double(I);

S=regcovsmooth(I,10,6,0.06,'M1');

% T=I-S;%texture
figure,imshow(S);%filtered image
toc
disp( ['Time: ',num2str(toc) ] );


