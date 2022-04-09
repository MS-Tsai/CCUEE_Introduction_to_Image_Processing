clear all;

% 讀檔
image = imread('cameraman.png');
image = double(image);

% 擷取照片中 頭的部分
head = image(33:96, 90:153);
figure(1), imshow(head/255);

% 執行雙線性內插法
output_b = interpolation(head, 2, 'bilinear');

% show 出結果
figure(2), imshow(output_b/255);