clear all;

% 讀檔
image = imread('cameraman.tif');
image = double(image);

% 執行旋轉
output = imgrotate(image, 30);

% show 出結果
figure(1), imshow(image/255);
figure(2), imshow(output/255);