clear all;

% 讀檔
image = imread('cameraman.tif');
image = double(image);

% 擷取照片中 頭的部分
head = image(33:96, 90:153);
figure(1), imshow(head/255);

% 執行兩種內插法
output_n = interpolation(head, 3, 'nearest');
output_b = interpolation(head, 3, 'bilinear');

% show 出結果
figure(2), imshow(output_n/255);
figure(3), imshow(output_b/255);
