clear all;

image = imread('pout.png');
image = double(image);

R = image(: , : , 1); %取出img中的R
G = image(: , : , 2); %取出img中的G
B = image(: , : , 3); %取出img中的B

Gray = 0.299*R + 0.587*G + 0.114*B; %彩色轉灰階公式
Gray = uint8(Gray);

figure(1), imshow(Gray);
figure(2), histogram(Gray);

Gray = double(Gray);

% set 調整值
first = [0 .3 .5 .6 1];
second = [0 .3 .7 .95 1];

% 執行 piecewise linear function 調整
result = histpwl(Gray/255, first, second);

% show 出結果
figure(3), plot(Gray, result, '.');
figure(4), imshow(result), figure(5), histogram(result*255), axis tight;