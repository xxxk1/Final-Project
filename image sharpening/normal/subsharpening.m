tic
a = imread('images\flower.jpg');
% figure, imshow(a);
image = im2double(a);

[A, result] = svf(double(a)/255.0, 3, 0.025);

% figure,imshow(result);
% figure,imshow(A);

T = image - result;
% figure,imshow(T);

sharpening_T = result + 2*T;
figure,imshow(sharpening_T);
% imwrite(sharpening_T,'results\forest_t_sub.png');

% sharpening_u = T + 1.2*result;
% figure,imshow(sharpening_u);
% imwrite(sharpening_u,'results\forest_u_sub.png');
% 
% sharpening_a = 2*T + 1.2*result;
% figure,imshow(sharpening_a);
% imwrite(sharpening_a,'results\forest_a_peng.jpg');

% imwrite(result,'enhanced_tree_sub.jpg');
toc
disp( ['运行时间: ',num2str(toc) ] );