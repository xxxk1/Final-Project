clc
clear;
I=imread('30_greyscale.jpg'); %��ȡͼ��
figure(1);
imshow(I);
title('ԭͼ��'); %��ʾԭʼͼ��

%%
%����ģ��
size_moban=11;
length = floor(size_moban/2);
a(1:size_moban,1:size_moban)=1;%ģ��С��ͼ��
image=wextend('2D','sym',I,size_moban);%%��չ
%%
[M,N] = size(image);%%��չ���ͼ���С
W = double(image);
result = W;

for i=1+size_moban:M-size_moban
    for j=1+size_moban:N-size_moban
        m=W(i:i+(size_moban-1),j:j+(size_moban-1)).*a(1:size_moban,1:size_moban); %ȡ��x1�д�(i,j)��ʼ��n��n��Ԫ����ģ�����
        k=hist_1(uint8(m));%�Ծֲ�����ֱ��ͼ����
        after=double(k);
        result(i,j)=after(1+length,1+length); %����������ĵ������ֵ����ԭͼ��Ӧ���Ԫ�أ�δ����ֵ��Ԫ��ȡԭֵ
    end
end

Picture=result(size_moban+1:M-size_moban,size_moban+1:N-size_moban);%%���⻯��ȡԭͼ���С
Picture=uint8(Picture);
figure;
imshow(Picture);
title('�仯���ͼ��'); %��ʾ������ͼ��

%%
%ֱ��ͼ���⻯����
function hist_img = hist_1(I)
    [M, N] = size(I);
    size_img = M*N;
    c = zeros(1,256);%ͳ��ÿ��ÿ������ֵ�ĸ���
    b= c;%ת��ǰ��Ķ��ձ�
  
    temp = I(:);
    temp = sort(temp);
    
    for i = 1:size_img
        c(temp(i)+1) = c(temp(i)+1)+1;      
    end
    a = c;%���
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
