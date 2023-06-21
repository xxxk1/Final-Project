function [J] = imhisteq_C(Im) 
[M,N,C]=size(Im);  %获得输入图像尺寸M、N、C（size函数）

for index_d=1:C
I = Im(:,:,index_d);

I0 = double(I);%矩阵F中的数据由uint8类型转换为double类型以便后续处理。

%计算图像F的灰度直方图h（imhist函数)
%或者通过两重循环遍历每个像素点从而得到每个灰度值的累计像素点个数）。
h = imhist(I,256)';
%计算原图的灰度分布概率Pf =h/(M*N)    (i=0,1,…,255)。
Pf = h/(M*N);
%计算原图灰度的累计分布Pa（使用cumsum函数）
Pa = cumsum(Pf);
%令Pa(1)=0
Pa(1)=0;
%Pa_1= Pa *255。将Pa_1四舍五入.
Pa_1 = round(Pa*255);

%置两重循环遍历图像F中所有像素点，求出每一个像素点的灰度值F(i,j)
for i=1:M
    for j=1:N
        J(i,j,index_d) = Pa_1(round(I0(i,j)+1));
    end
end
%计算得到的新图像矩阵中所有点的灰度值由double转换为uint8
J = uint8(J);  %转换uint8编码
end;




