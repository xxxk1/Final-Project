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


im = im2double(imread('cameraman.tif'));
[Rows Cols]= size(im);
result = im;

h = 2;
maxiter = 1;
for i = 1:maxiter
imPadded = padarray(result,[h h],'replicate');

for x = (h+1):Rows+h
  for y = (h+1):Cols+h 
     % window & subwindows
     W = imPadded((x-h):(x+h),(y-h):(y+h)); % (2h+1)x(2h+1) window
     A = W(1:3,1:3); % a-window
     B = W(1:3,3:5); % b-window
     C = W(3:5,1:3); % c-window
     D = W(3:5,3:5); % d-window
%
%      A = W(1:4,1:4); % a-window
%      B = W(1:4,2:5); % b-window
%      C = W(2:5,1:4); % c-window
%      D = W(2:5,2:5); % d-window
%
%      A = W(1:2,1:2); % a-window
%      B = W(1:2,2:3); % b-window
%      C = W(2:3,1:2); % c-window
%      D = W(2:3,2:3); % d-window

    
     % find the variances and means
     s = var([A(:) B(:) C(:) D(:)]);
     m = mean([A(:) B(:) C(:) D(:)]);
     [z,k] = min(s);
     result(x-h,y-h) = m(k);
  end
end

end

figure,imshow([im,result]),title('original and filtered');
figure,imshow([im,result+5*(im-result)]),title('original and sharpened');


