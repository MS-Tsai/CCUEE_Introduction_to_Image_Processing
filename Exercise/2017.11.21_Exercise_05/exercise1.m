clear all;

% 用 magic function 創造矩陣測試
matrix = double(10*magic(5));

% 讀檔測試
image = imread('cameraman.tif');
figure(1), imshow(image);
image = double(image);

% filter 類型
filter = ones(3, 3)/9;
filter_L = [1/6, 2/3, 1/6 ; 2/3, -10/3, 2/3 ;  1/6, 2/3, 1/6]; % Laplacian filter

% 執行各式濾波
output_valid = myFilter2(filter, image, 'valid');
output_zero = myFilter2(filter, image, 'zeros');
output_full = myFilter2(filter, image, 'full');
output_mirror = myFilter2(filter, image, 'mirror');
output_full_m = myFilter2(filter, image, 'full_mirror');
output_Laplacian = myFilter2(filter_L, image, 'zeros');

% show 出結果
figure(2), imshow(output_valid/255);
figure(3), imshow(output_zero/255);
figure(4), imshow(output_full/255);
figure(5), imshow(output_mirror/255);
figure(6), imshow(output_full_m/255);
figure(7), imshow(output_Laplacian/100);