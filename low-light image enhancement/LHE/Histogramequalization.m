function Histogramequalization()
[f,p]=uigetfile('*.*','选择图像文件');
if f
I=imread(strcat(p,f));
end
 
h=figure();
set(h,'position',[300 100 1000 600]);
 
Ir=I(:,:,1);%提取红色分量
Ig=I(:,:,2);%提取绿色分量
Ib=I(:,:,3);%提取蓝色分量
I1=histeq(Ir);   %直方图均衡化函数histeq
I2=histeq(Ig);
I3=histeq(Ib);
c=cat(3,I1,I2,I3);  %cat用于构造多维数组
subplot(2,4,1);imshow(I);
title('A). 原始图像');  
subplot(2,4,5);imshow(c);
title('B). 直方图均衡化');
 
subplot(2,4,2);
imhist(Ir);
title('I). 红色分量直方图');
subplot(2,4,6);
imhist(I1);
title('II). R均衡化后直方图');
subplot(2,4,3);
imhist(Ig);
title('I). 绿色分量直方图');
subplot(2,4,7);
imhist(I2);
title('II). G均衡化后直方图');
subplot(2,4,4);
imhist(Ib);
title('I). 蓝色分量直方图');
subplot(2,4,8);
imhist(I3);
title('II). B均衡化后直方图');