function [Ti,Tout,img_out,Iout] = lime_main_module_sub(img_in,mu,rho,flag)
%main module incluidng all operations for LIME

%img_in is raw image
%alpha, mu, rho are constant parameters for the solver
%ds is degree of smoothing and ss is spatial smoothing for bilateral filter
%flag kept 1 for displaying outputs

%Ti is initial illumination map
%Tout is refined Ti
%img_out is enhanced image
%I_out is img_out after denoising

alpha=0.08; %same value for all images
gamma=0.8; %parameter for gamma correction

[Tout,Ti]=lime(img_in,alpha,mu,rho,gamma);
img_out=im2double(img_in)./Tout;

% Iout=imbilatfilt(img_out,ds,ss);
%% denoise guided filter
a = img_out;
% figure, imshow(a);

[A, result] = svf(a, 3, 0.025);
% figure,imshow(result);
% imwrite(result,'enhanced_tree_sub.jpg');
Iout = result;


%% output
if flag==1
%     subplot(2,3,1);imshow(img_in);
%     figure,colormap('hot');imagesc(Ti(:,:,1));colorbar; %heat map
%    
%     figure,colormap('hot');imagesc(Tout(:,:,1));colorbar;
  
%     figure;imshow(img_out);
%     imwrite(img_out,'enhanced_noisy.jpg');
    figure;imshow(Iout);
    imwrite(Iout,'enhanced_denoised_3_sub.jpg');
end

end