clear all;

% Ū��
image = imread('pout.tif');
image = image/2; % ���F���v����t�@�I
figure(1), imshow(image);
figure(2), histogram(image);

% �N�v��������ର�x�}
hist = transfer(image);

% �� CDF mapping �쪽��� ---> �s�����(�x�})
new_hist = myHisteq(hist, image);

% �N��l�� mapping ��s��
new_image = mapping(hist, image);

% show �X���G
figure(3), imshow(new_image);
figure(4), histogram(new_image);