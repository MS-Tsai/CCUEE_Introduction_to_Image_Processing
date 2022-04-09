clear, clc;

% Ū��
image = imread('cameraman.tif');
image = double(image);
figure(1), imshow(image/255);

% ���� Hough Transform
Hough = myHough2(image);
figure(2), imshow(Hough/max(max(Hough))*15);

% ��X�j�� 0.66���̤j�� ���b�|�򨤫�
M = max(Hough(:));
[r, theta] = find(Hough >= 0.66*M);

% ��b�|�򨤫׹����쪺�u�e�X��
myHoughLine(image, r, theta);