clear all;

image = imread('cameraman.png');
image = double(image);
figure(1), imshow(image/255);

% 決定 Gaussian 濾波器
filter_G = Gaussian(2);

% 執行濾波 (這邊 type 是使用 zeros)
output_zeros_G = myFilter2(filter_G, image, 'zeros');

% show 出結果
figure(2), imshow(output_zeros_G/255); % Gaussian Filter 的結果，值會落在0~255之間