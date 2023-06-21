close all; clear all; clc;
tic

im = double(imread('T_tree.jpg')) / 255;%original image
figure,imshow(im)

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

figure,imshow(result)%filtered image

toc
disp( ['Time: ',num2str(toc) ] );

