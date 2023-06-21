function Histogramequalization()
[f,p]=uigetfile('*.*','ѡ��ͼ���ļ�');
if f
I=imread(strcat(p,f));
end
 
h=figure();
set(h,'position',[300 100 1000 600]);
 
Ir=I(:,:,1);%��ȡ��ɫ����
Ig=I(:,:,2);%��ȡ��ɫ����
Ib=I(:,:,3);%��ȡ��ɫ����
I1=histeq(Ir);   %ֱ��ͼ���⻯����histeq
I2=histeq(Ig);
I3=histeq(Ib);
c=cat(3,I1,I2,I3);  %cat���ڹ����ά����
subplot(2,4,1);imshow(I);
title('A). ԭʼͼ��');  
subplot(2,4,5);imshow(c);
title('B). ֱ��ͼ���⻯');
 
subplot(2,4,2);
imhist(Ir);
title('I). ��ɫ����ֱ��ͼ');
subplot(2,4,6);
imhist(I1);
title('II). R���⻯��ֱ��ͼ');
subplot(2,4,3);
imhist(Ig);
title('I). ��ɫ����ֱ��ͼ');
subplot(2,4,7);
imhist(I2);
title('II). G���⻯��ֱ��ͼ');
subplot(2,4,4);
imhist(Ib);
title('I). ��ɫ����ֱ��ͼ');
subplot(2,4,8);
imhist(I3);
title('II). B���⻯��ֱ��ͼ');