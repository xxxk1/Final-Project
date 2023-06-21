% X= imread('lime\images\30.jpg');
% Y= imread('lime\enhanced_30_sub.png');
% psnr(X, Y)

X= imread('lime\images\30.jpg');
Y= imread('lime\enhanced_30_guided.jpg');
 
s = ssim(X, Y)