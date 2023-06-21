% ����ԭʼͼ��
I = imread('cat.bmp');

% �����˲������ڴ�С�ͷ���Ȩ��ϵ��
win_size = 9;
var_weight = 0.2;

% ��ԭʼͼ����������˲����õ��ṹ��Ϣ
guide = imguidedfilter(I, 'NeighborhoodSize', win_size, 'DegreeOfSmoothing', 0.01*I);

% ����ṹ��Ϣ�ķ���ͼ��
variance = guidedfilter(I, ones(size(I)), 'NeighborhoodSize', win_size, 'DegreeOfSmoothing', 0.01*I);
variance = variance - guide.^2;

% ��ԭʼͼ����м�Ȩƽ���õ��񻯺��ͼ��
sharpened = I + var_weight * variance;

% ��ʾԭʼͼ����񻯺��ͼ��
figure;
subplot(1,2,1); imshow(I); title('Original Image');
subplot(1,2,2); imshow(sharpened); title('Sharpened Image');
