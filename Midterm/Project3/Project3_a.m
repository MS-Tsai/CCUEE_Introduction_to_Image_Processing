clear all;

% Ū��
image = imread('cameraman.png');
image = double(image);

% �^���Ӥ��� �Y������
head = image(33:96, 90:153);
figure(1), imshow(head/255);

% �����F�����k
output_n = interpolation(head, 2, 'nearest');

% show �X���G
figure(2), imshow(output_n/255);