clear all;

%------------- Exercise 2 -----------------
img = imread('pout.tif');
figure(1), imshow(img), figure(2), histogram(img), axis tight; % histogram �������

img = double(img); % �N img �q uint8 �ର double

% set �վ��
first = [0 .25 .5 .75 1];
second = [0 .75 .25 .5 1];

% ���� piecewise linear function �վ�
result = histpwl(img/255, first, second);

% show �X���G
figure(3), plot(img, result, '.');
figure(4), imshow(result), figure(5), histogram(result*255), axis tight;
