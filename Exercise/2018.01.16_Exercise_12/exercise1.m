clear, clc;

% 讀檔
image = imread('cameraman.tif');
image = double(image);
figure(1), imshow(image/255);

% 執行 Hough Transform
Hough = myHough2(image);
figure(2), imshow(Hough/max(max(Hough))*15);

% 找出大於 0.66倍最大值 的半徑跟角度
M = max(Hough(:));
[r, theta] = find(Hough >= 0.66*M);

% 把半徑跟角度對應到的線畫出來
myHoughLine(image, r, theta);