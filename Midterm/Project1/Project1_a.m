clear all;

image = imread('pout.png');
image = double(image);

R = image(: , : , 1); %���Ximg����R
G = image(: , : , 2); %���Ximg����G
B = image(: , : , 3); %���Ximg����B

Gray = 0.299*R + 0.587*G + 0.114*B; %�m����Ƕ�����
Gray = uint8(Gray);

figure(1), imshow(Gray);
figure(2), histogram(Gray);

Gray = double(Gray);

% set �վ��
first = [0 .3 .5 .6 1];
second = [0 .3 .7 .95 1];

% ���� piecewise linear function �վ�
result = histpwl(Gray/255, first, second);

% show �X���G
figure(3), plot(Gray, result, '.');
figure(4), imshow(result), figure(5), histogram(result*255), axis tight;