% ����ԭʼͼ��
I = imread('cat.bmp');
% a = 0.01*I;

% �����˲������ڴ�С�ͷ���Ȩ��ϵ��
win_size = 9;
var_weight = 0.2;

% ��ԭʼͼ����������˲����õ��ṹ��Ϣ
guide = imguidedfilter(I, 'NeighborhoodSize', win_size, 'DegreeOfSmoothing', 0.1);

% ����������Ϣ
texture = I - guide;

% ����ṹ��Ϣ
structure = guide;

% ���ýṹ��������Ϣ�õ��񻯺��ͼ��
sharpened = structure + var_weight * texture;

% ��ʾԭʼͼ����񻯺��ͼ��
figure;
subplot(1,2,1); imshow(I); title('Original Image');
subplot(1,2,2); imshow(sharpened); title('Sharpened Image');
