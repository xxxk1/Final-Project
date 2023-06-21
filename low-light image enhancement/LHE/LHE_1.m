clc
clear;
I=imread('30_greyscale.jpg'); %读取图像
figure(1);
imshow(I);
title('原图象'); %显示原始图象

%%
%建立模板
size_moban=11;
length = floor(size_moban/2);
a(1:size_moban,1:size_moban)=1;%模板小于图像
image=wextend('2D','sym',I,size_moban);%%扩展
%%
[M,N] = size(image);%%扩展后的图像大小
W = double(image);
result = W;

for i=1+size_moban:M-size_moban
    for j=1+size_moban:N-size_moban
        m=W(i:i+(size_moban-1),j:j+(size_moban-1)).*a(1:size_moban,1:size_moban); %取出x1中从(i,j)开始的n行n列元素与模板相乘
        k=hist_1(uint8(m));%对局部进行直方图均衡
        after=double(k);
        result(i,j)=after(1+length,1+length); %将均衡后中心点的像素值赋给原图对应点的元素，未被赋值的元素取原值
    end
end

Picture=result(size_moban+1:M-size_moban,size_moban+1:N-size_moban);%%均衡化后，取原图像大小
Picture=uint8(Picture);
figure;
imshow(Picture);
title('变化后的图像'); %显示均衡后的图象

%%
%直方图均衡化程序
function hist_img = hist_1(I)
    [M, N] = size(I);
    size_img = M*N;
    c = zeros(1,256);%统计每个每个像素值的个数
    b= c;%转化前后的对照表
  
    temp = I(:);
    temp = sort(temp);
    
    for i = 1:size_img
        c(temp(i)+1) = c(temp(i)+1)+1;      
    end
    a = c;%求和
    for i = 2:256
       a(i) = c(i) + a(i-1);
    end
    
    min_cdf = 10000;
    for i = 1:256
       if a(i)>0
           if a(i) < min_cdf
                min_cdf = a(i);
           end
       end
    end
    
    for j = 1:256
        if a(j) > 0
             b(j) = round(255*(a(j)-min_cdf)/(size_img-min_cdf));
        end
    end
    
    for i = 1:M
        for j = 1:N
            I(i,j) = b(I(i,j)+1);
        end       
    end
    
    hist_img = I;
 
end
