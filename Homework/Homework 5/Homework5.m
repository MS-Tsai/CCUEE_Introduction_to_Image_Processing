clear all;

% Ū��
image = imread('cameraman.tif');
image = double(image);

% �^���Ӥ��� �Y������
head = image(33:96, 90:153);
figure(1), imshow(head/255);

% �����ؤ����k
output_n = interpolation(head, 3, 'nearest');
output_b = interpolation(head, 3, 'bilinear');

% show �X���G
figure(2), imshow(output_n/255);
figure(3), imshow(output_b/255);
