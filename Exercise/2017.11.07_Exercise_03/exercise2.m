clear all;

%------------- Exercise 2 -----------------
img = imread('pout.tif');
figure(1), imshow(img), figure(2), histogram(img), axis tight; % histogram 為直方圖

img = double(img); % 將 img 從 uint8 轉為 double

% set 調整值
first = [0 .25 .5 .75 1];
second = [0 .75 .25 .5 1];

% 執行 piecewise linear function 調整
result = histpwl(img/255, first, second);

% show 出結果
figure(3), plot(img, result, '.');
figure(4), imshow(result), figure(5), histogram(result*255), axis tight;
