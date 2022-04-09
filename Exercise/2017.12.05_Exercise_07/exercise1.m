clear all;

% 讀檔
image = imread('cameraman.tif');
image = double(image);

% bilinear 內插空間濾波器
filter = [0, 0, 0, 0, 0, 0, 0 ; 
          0, 1, 2, 3, 2, 1, 0 ; 
          0, 2, 4, 6, 4, 2, 0 ;
          0, 3, 6, 9, 6, 3, 0 ;
          0, 2, 4, 6, 4, 2, 0 ;
          0, 1, 2, 3, 2, 1, 0 ;
          0, 0, 0, 0, 0, 0, 0 ]/9;

% 將原圖執行零交錯
image_zero = myZeroint(image, 3);

% 執行 bilinear 內插 (type = zeros)
output = myFilter2(filter, image_zero, 'zeros');

% show 出結果
figure(1), imshow(output/255);