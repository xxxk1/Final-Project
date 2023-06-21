function [img_out] = histeq_yuv(img_in)
%applying histogram equalization on y channel

imghsv=rgb2yuv(im2double(img_in)); %colorspace conversion

imgeq=histeq(imghsv(:,:,1));

%recomposing
imgnew(:,:,1)=imgeq;
imgnew(:,:,2)=imghsv(:,:,2);
imgnew(:,:,3)=imghsv(:,:,3);

img_out=yuv2rgb(imgnew); %colorspace conversion

end