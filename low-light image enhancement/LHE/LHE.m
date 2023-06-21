function [J] = imhisteq_C(Im) 
[M,N,C]=size(Im);  %�������ͼ��ߴ�M��N��C��size������

for index_d=1:C
I = Im(:,:,index_d);

I0 = double(I);%����F�е�������uint8����ת��Ϊdouble�����Ա��������

%����ͼ��F�ĻҶ�ֱ��ͼh��imhist����)
%����ͨ������ѭ������ÿ�����ص�Ӷ��õ�ÿ���Ҷ�ֵ���ۼ����ص��������
h = imhist(I,256)';
%����ԭͼ�ĻҶȷֲ�����Pf =h/(M*N)    (i=0,1,��,255)��
Pf = h/(M*N);
%����ԭͼ�Ҷȵ��ۼƷֲ�Pa��ʹ��cumsum������
Pa = cumsum(Pf);
%��Pa(1)=0
Pa(1)=0;
%Pa_1= Pa *255����Pa_1��������.
Pa_1 = round(Pa*255);

%������ѭ������ͼ��F���������ص㣬���ÿһ�����ص�ĻҶ�ֵF(i,j)
for i=1:M
    for j=1:N
        J(i,j,index_d) = Pa_1(round(I0(i,j)+1));
    end
end
%����õ�����ͼ����������е�ĻҶ�ֵ��doubleת��Ϊuint8
J = uint8(J);  %ת��uint8����
end;




