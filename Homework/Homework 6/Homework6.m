clear all;

% Ū��
image = imread('cameraman.tif');
image = double(image);

% �������
output = imgrotate(image, 30);

% show �X���G
figure(1), imshow(image/255);
figure(2), imshow(output/255);