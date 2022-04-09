clear all;

%------------- Exercise 1 -----------------
img = imread('pout.tif');
figure(1), imshow(img), figure(2), histogram(img), axis tight; % histogram �������

img = double(img); % �N img �q uint8 �ର double

% ���X�P img �j�p�ۦP��0�x�}
row = size(img, 1);
column = size(img, 2);
img_result = zeros(row, column);

% ���� Histogram Stretching (����X�T�ӰϬq �ثe�ȶ����b (80, 170))
dark = find(img >=0 & img < 80);
middle = find(img >= 80 & img <= 170);
bright = find(img > 170 & img <= 255);

% ���O�N�T�ӰϬq�P�禡�� mapping
img_result(dark) = img(dark).*0.25;
img_result(middle) = img(middle).*2.33-166.67;
img_result(bright) = img(bright)*0.2941+180;

% �N img �����ȳW�d�b (0, 255)
small = find(img_result < 0);
large = find(img_result > 255);
img_result(small) = 0;
img_result(large) = 255;

% show �X���G
figure(3), plot(img, img_result, '.'); % �i�����̶����t�� (�H��{���@�ϧe�{)
figure(4), imshow(img_result/255), figure(5), histogram(img_result), axis tight;