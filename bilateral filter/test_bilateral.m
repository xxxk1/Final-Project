f = @(x) imbilatfilt(x,0.05,5);

x0 = im2double(imread('cameraman.tif'));
w = 7; sigma_d = 2; sigma_r = 0.2;
y = bilateral(x0,w,sigma_d,sigma_r);

figure,imshow([x0,y,f(x0)]);

function out = bilateral(im,w,sigma_d,sigma_r)
  im = im2double(im);
  [r,c] = size(im);
  out = zeros(r,c);
  A = padarray(im,[w,w],'symmetric');
  G = fspecial('gaussian',2*w+1,sigma_d);
  for i = 1+w:r+w-1
      for j = 1+w:c+w-1
	      R = A(i-w:i+w,j-w:j+w);
		  H = exp(-(R-A(i,j)).^2/(2*sigma_r^2));   
          F = H.*G;
		  out(i-w,j-w) = sum(F(:).*R(:))/sum(F(:));
      end
  end
end	