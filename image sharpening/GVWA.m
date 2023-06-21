% 读入原始图像
I = imread('cat.bmp');

% 定义滤波器窗口大小和方差权重系数
win_size = 9;
var_weight = 0.2;

% 对原始图像进行引导滤波，得到结构信息
guide = imguidedfilter(I, 'NeighborhoodSize', win_size, 'DegreeOfSmoothing', 0.01*I);

% 计算结构信息的方差图像
variance = guidedfilter(I, ones(size(I)), 'NeighborhoodSize', win_size, 'DegreeOfSmoothing', 0.01*I);
variance = variance - guide.^2;

% 对原始图像进行加权平均得到锐化后的图像
sharpened = I + var_weight * variance;

% 显示原始图像和锐化后的图像
figure;
subplot(1,2,1); imshow(I); title('Original Image');
subplot(1,2,2); imshow(sharpened); title('Sharpened Image');
