clear all;

% Ū��
image = imread('cameraman.png');
image = double(image);

% �^���Ӥ��� �Y������
head = image(33:96, 90:153);
figure(1), imshow(head/255);

% �������u�ʤ����k
output_b = interpolation(head, 2, 'bilinear');

% show �X���G
figure(2), imshow(output_b/255);