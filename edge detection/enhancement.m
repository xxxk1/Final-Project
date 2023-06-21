% example: detail enhancement
% figure 6 in our paper

close all;
tic
I = double(imread('cat.png')) / 255;
figure,imshow(I);

p = I;

r = 16;
eps = 0.1^2;

q = zeros(size(I));

% q(:, :) = guidedfilter(I(:, :), p(:, :), r, eps);
q(:, :, 1) = guidedfilter(I(:, :, 1), p(:, :, 1), r, eps);
q(:, :, 2) = guidedfilter(I(:, :, 2), p(:, :, 2), r, eps);
q(:, :, 3) = guidedfilter(I(:, :, 3), p(:, :, 3), r, eps);


I_enhanced = (I - q) * 5 + q;

figure();
% imshow([I, q, I_enhanced], [0, 1]);
imshow(q);
% imwrite(q,'guided_result.png');
toc
disp( ['运行时间: ',num2str(toc) ] );