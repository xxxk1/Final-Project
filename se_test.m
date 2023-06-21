% x = im2double(imread('cat.bmp'));
% [m,n] = size(x);
% y = ifft(x);
% z = m*n*ifft(y);
% figure,imshow([x,z]);

x = [1,2,3;4,5,6;7,8,9]
y = ifft2(x)
z = 9*ifft2(y)