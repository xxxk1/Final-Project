tic
a = imread('seagull.jpg');
image = im2double(a);%original image

[A, result] = svf(double(a)/255.0, 6, 0.05);
figure,imshow(result);%filtered image

toc
disp( ['运行时间: ',num2str(toc) ] );