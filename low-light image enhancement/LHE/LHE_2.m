filename = '30.jpg';
I = im2double(imread(filename));
alpha = 0.06;
tic
J(:,:,1) = adapthisteq(I(:,:,1),'ClipLimit',alpha);
J(:,:,2) = adapthisteq(I(:,:,2),'ClipLimit',alpha);
J(:,:,3) = adapthisteq(I(:,:,3),'ClipLimit',alpha);
t = toc
figure,imshow(I);
figure,imshow(J);