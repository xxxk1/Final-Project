%������

function coloraverageguided()
I=imread('tree.jpg');
% imshow(I);
I1=I(:,:,1);%��ȡ��ɫ����
I2=I(:,:,2);%��ȡ��ɫ����
I3=I(:,:,3);%��ȡ��ɫ����
I1=histogram(I1);   %����ĺ���
I2=histogram(I2);
I3=histogram(I3);
c=cat(3,I1,I2,I3);  %cat���ڹ����ά����
% figure,imshow(I);
% figure,imshow(c);
% imwrite(c,'LHE_enhanced_tree.jpg');

%% guided
I_1 = double(c) / 255;
% figure,imshow(I_1);
% imwrite(I,'enhanced_tree.jpg');

p = I_1;

r = 16;
eps = 0.1^2;

q = zeros(size(I_1));

% q(:, :) = guidedfilter(I(:, :), p(:, :), r, eps);
q(:, :, 1) = guidedfilter(I_1(:, :, 1), p(:, :, 1), r, eps);
q(:, :, 2) = guidedfilter(I_1(:, :, 2), p(:, :, 2), r, eps);
q(:, :, 3) = guidedfilter(I_1(:, :, 3), p(:, :, 3), r, eps);

% I_enhanced = (I_1 - q) * 5 + q;

% figure();
% imshow([I, q, I_enhanced], [0, 1]);
figure,imshow(q);
% imwrite(q,'enhanced_tree_guided.jpg');
% figure,imshow(I_enhanced);


 
%% ���õģ�ֱ��ͼ���⻯�����캯��
function d=histogram(I)%����histogram����
J=I;
[m,n]=size(I);      %ȷ�������С
area=m*n;
a=zeros(1,256);     %����1*256�������a,�������ԭʼͼ������Ҷ�ֵ�ĸ���
b=zeros(1,256);
for i=1:m           %��¼�����Ҷ�ֵ�ĸ���
    for j=1:n
        d=I(i,j)+1;   %��ȡ(i,j)λ�õĻҶ�ֵ(ע�⣺�Ҷ�ֵΪ0-255����Ӧ�����1-256��
        a(1,d)=a(1,d)+1;    %����a�϶�Ӧ�Ҷ�ֵ�ļ���+1
    end
end
for i=1:256         %���⻯
    sum=0;
    for j=1:i
        sum=sum+a(1,j);
    end
    b(1,i)=sum*255/area;
end
for i=1:m           %�þ��⻯������ݴ���ԭλ�õ�����
    for j=1:n
        d=J(i,j)+1;
        J(i,j)=b(1,d);
    end
end
d=J;
