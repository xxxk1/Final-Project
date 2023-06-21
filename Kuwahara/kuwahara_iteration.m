close all; clear all; clc;
% The Kuwahara filter works on a window divided into 4 overlapping
% 5x5 subwindows. In each subwindow, the mean and variance are computed. 
% The output value (located at the center of the window) is set to the 
% mean of the subwindow with the smallest variance.
%
%    ( a  a  ab  b  b )
%    ( a  a  ab  b  b )
%    (ac ac abcd bd bd)
%    ( c  c  cd  d  d )
%    ( c  c  cd  d  d )
%
%    ( a    ab    ab    ab    b )
%    ( ac  abcd  abcd  abcd  bd )
%    ( ac  abcd  abcd  abcd  bd )
%    ( ac  abcd  abcd  abcd  bd )
%    ( c    cd    cd    cd    d )
% 
%    ( a    ab    b )
%    ( ac  abcd  bd )
%    ( c    cd    d )
tic

%im = im2double(imread('cat.png'));
im = double(imread('2.jpg')) / 255;
figure,imshow(im)


[Rows Cols]= size(im);
result = im;

h = 1; %3x3 subwindows
% h = 2; %5x5 subwindows
% h = 3; %7x7 subwindows
% h = 4; %9x9 subwindows
% h = 10; %21x21 subwindows
maxiter = 1;
for i = 1:maxiter
imPadded = padarray(result,[h h],'replicate');

for x = (h+1):Rows+h
  for y = (h+1):Cols+h 
     % window & subwindows
     W = imPadded((x-h):(x+h),(y-h):(y+h)); % (2h+1)x(2h+1) window

% 2x2 neighborhoods
     A = W(1:2,1:2); % a-window
     B = W(1:2,2:3); % b-window
     C = W(2:3,1:2); % c-window
     D = W(2:3,2:3); % d-window

% 3x3 neighborhoods
%      A = W(1:3,1:3); % a-window
%      B = W(1:3,3:5); % b-window
%      C = W(3:5,1:3); % c-window
%      D = W(3:5,3:5); % d-window
%
% 4x4 neighborhoods
%      A = W(1:4,1:4); % a-window
%      B = W(1:4,2:5); % b-window
%      C = W(2:5,1:4); % c-window
%      D = W(2:5,2:5); % d-window
% 7x7 neighborhoods
%      A = W(1:7,1:7); % a-window
%      B = W(1:7,7:13); % b-window
%      C = W(7:13,1:7); % c-window
%      D = W(7:13,7:13); % d-window


    
     % find the variances and means
     s = var([A(:) B(:) C(:) D(:)]);
     m = mean([A(:) B(:) C(:) D(:)]);
     [z,k] = min(s);
     result(x-h,y-h) = m(k);
  end
end

end

%figure,imshow([im,result]),title('original and filtered');
figure,imshow(result)%,title('filtered');
imwrite(result,'2_1.jpg');
% imwrite(result,'3sub2nei.png');
% imwrite(result,'enhanced_lamp_kuwahara.png');
%figure,imshow([im,result+5*(im-result)]),title('original and sharpened');

%% iteration 1
im1 = double(imread('2_1.jpg')) / 255;
figure,imshow(im1)


[Rows Cols]= size(im1);
result = im1;

h = 1; %3x3 subwindows

maxiter = 1;
for i = 1:maxiter
imPadded = padarray(result,[h h],'replicate');

for x = (h+1):Rows+h
  for y = (h+1):Cols+h 
     % window & subwindows
     W = imPadded((x-h):(x+h),(y-h):(y+h)); % (2h+1)x(2h+1) window

% 2x2 neighborhoods
     A = W(1:2,1:2); % a-window
     B = W(1:2,2:3); % b-window
     C = W(2:3,1:2); % c-window
     D = W(2:3,2:3); % d-window

% find the variances and means
     s = var([A(:) B(:) C(:) D(:)]);
     m = mean([A(:) B(:) C(:) D(:)]);
     [z,k] = min(s);
     result(x-h,y-h) = m(k);
  end
end

end

figure,imshow(result)%,title('filtered');
imwrite(result,'2_2.jpg');

%% iteration 2
im2 = double(imread('2_2.jpg')) / 255;
figure,imshow(im2)


[Rows Cols]= size(im2);
result = im2;

h = 1; %3x3 subwindows

maxiter = 1;
for i = 1:maxiter
imPadded = padarray(result,[h h],'replicate');

for x = (h+1):Rows+h
  for y = (h+1):Cols+h 
     % window & subwindows
     W = imPadded((x-h):(x+h),(y-h):(y+h)); % (2h+1)x(2h+1) window

% 2x2 neighborhoods
     A = W(1:2,1:2); % a-window
     B = W(1:2,2:3); % b-window
     C = W(2:3,1:2); % c-window
     D = W(2:3,2:3); % d-window

% find the variances and means
     s = var([A(:) B(:) C(:) D(:)]);
     m = mean([A(:) B(:) C(:) D(:)]);
     [z,k] = min(s);
     result(x-h,y-h) = m(k);
  end
end

end

figure,imshow(result)%,title('filtered');
imwrite(result,'2_3.jpg');

%% iteration3

im3 = double(imread('2_3.jpg')) / 255;
figure,imshow(im3)


[Rows Cols]= size(im3);
result = im3;

h = 1; %3x3 subwindows

maxiter = 1;
for i = 1:maxiter
imPadded = padarray(result,[h h],'replicate');

for x = (h+1):Rows+h
  for y = (h+1):Cols+h 
     % window & subwindows
     W = imPadded((x-h):(x+h),(y-h):(y+h)); % (2h+1)x(2h+1) window

% 2x2 neighborhoods
     A = W(1:2,1:2); % a-window
     B = W(1:2,2:3); % b-window
     C = W(2:3,1:2); % c-window
     D = W(2:3,2:3); % d-window

% find the variances and means
     s = var([A(:) B(:) C(:) D(:)]);
     m = mean([A(:) B(:) C(:) D(:)]);
     [z,k] = min(s);
     result(x-h,y-h) = m(k);
  end
end

end

figure,imshow(result)%,title('filtered');
imwrite(result,'2_4.jpg');

%% iteration 4
im4 = double(imread('2_4.jpg')) / 255;
figure,imshow(im4)


[Rows Cols]= size(im4);
result = im4;

h = 1; %3x3 subwindows

maxiter = 1;
for i = 1:maxiter
imPadded = padarray(result,[h h],'replicate');

for x = (h+1):Rows+h
  for y = (h+1):Cols+h 
     % window & subwindows
     W = imPadded((x-h):(x+h),(y-h):(y+h)); % (2h+1)x(2h+1) window

% 2x2 neighborhoods
     A = W(1:2,1:2); % a-window
     B = W(1:2,2:3); % b-window
     C = W(2:3,1:2); % c-window
     D = W(2:3,2:3); % d-window

% find the variances and means
     s = var([A(:) B(:) C(:) D(:)]);
     m = mean([A(:) B(:) C(:) D(:)]);
     [z,k] = min(s);
     result(x-h,y-h) = m(k);
  end
end

end

figure,imshow(result)%,title('filtered');
imwrite(result,'2_5.jpg');



toc
disp( ['运行时间: ',num2str(toc) ] );

