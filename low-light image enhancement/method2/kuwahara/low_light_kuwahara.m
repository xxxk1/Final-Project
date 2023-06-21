clear all;
close all;
clc;
tic
image = im2double(imread('tree.jpg'));
% figure, imshow(image),title('original low-light image');%figure1 original low-light image

%Separate R, G, B three channels
R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);

[r,c]=size(R);

%% choose the max value among three channels --- T
for m=1:r
    for n=1:c      
        a=max([R(m,n),G(m,n),B(m,n)]);
        T(m,n)=a;
    end
end
T;
figure,imshow(T)%figure2 grayscale image
% imwrite(T,'T_tree.jpg');

%% kuwahara --- U
im = double(T) / 255;
% figure,imshow(im)

[Rows Cols]= size(im);
result = im;

h = 2; %5x5 subwindows
maxiter = 1;
for i = 1:maxiter
imPadded = padarray(result,[h h],'replicate');

for x = (h+1):Rows+h
  for y = (h+1):Cols+h 
     % window & subwindows
     W = imPadded((x-h):(x+h),(y-h):(y+h)); % (2h+1)x(2h+1) window


% 3x3 neighborhoods
     A = W(1:3,1:3); % a-window
     B = W(1:3,3:5); % b-window
     C = W(3:5,1:3); % c-window
     D = W(3:5,3:5); % d-window
    
     % find the variances and means
     s = var([A(:) B(:) C(:) D(:)]);
     m = mean([A(:) B(:) C(:) D(:)]);
     [z,k] = min(s);
     result(x-h,y-h) = m(k);
  end
end

end


figure,imshow(result);

%% enhanced image --- E
im1 = im2double(result);
eps=0.1;
E = image./(im1+eps);
figure, imshow(E);
toc