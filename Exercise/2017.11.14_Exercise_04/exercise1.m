clear all;

% 讀檔
image = imread('pout.tif');
image = image/2; % 為了讓影像更暗一點
figure(1), imshow(image);
figure(2), histogram(image);

% 將影像直方圖轉為矩陣
hist = transfer(image);

% 用 CDF mapping 原直方圖 ---> 新直方圖(矩陣)
new_hist = myHisteq(hist, image);

% 將原始圖 mapping 到新圖
new_image = mapping(hist, image);

% show 出結果
figure(3), imshow(new_image);
figure(4), histogram(new_image);