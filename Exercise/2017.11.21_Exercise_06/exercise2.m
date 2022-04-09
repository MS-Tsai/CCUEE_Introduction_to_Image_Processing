clear all;

% �����X�o�i�� (��a b�զ����o�i��)
a = [0, 0, 0 ; 0, 1, 0 ; 0, 0, 0];
b = ones(3, 3)/9;

% �Ҽ{���P���Ѽ�
filter1 = a*4-3*b;
filter2 = a*10-10*b;
filter3 = a*10-3*b;

% Ū��
image = imread('cameraman.tif');
image = double(image);

% �����o�i
output1 = myFilter2(filter1, image, 'zeros');
output2 = myFilter2(filter2, image, 'zeros');
output3 = myFilter2(filter3, image, 'zeros');

% show �X���G
figure(1), imshow(output1/255);
figure(2), imshow(output2/350);
figure(3), imshow(output3/350);
