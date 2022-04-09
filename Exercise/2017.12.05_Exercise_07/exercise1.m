clear all;

% Ū��
image = imread('cameraman.tif');
image = double(image);

% bilinear �����Ŷ��o�i��
filter = [0, 0, 0, 0, 0, 0, 0 ; 
          0, 1, 2, 3, 2, 1, 0 ; 
          0, 2, 4, 6, 4, 2, 0 ;
          0, 3, 6, 9, 6, 3, 0 ;
          0, 2, 4, 6, 4, 2, 0 ;
          0, 1, 2, 3, 2, 1, 0 ;
          0, 0, 0, 0, 0, 0, 0 ]/9;

% �N��ϰ���s���
image_zero = myZeroint(image, 3);

% ���� bilinear ���� (type = zeros)
output = myFilter2(filter, image_zero, 'zeros');

% show �X���G
figure(1), imshow(output/255);