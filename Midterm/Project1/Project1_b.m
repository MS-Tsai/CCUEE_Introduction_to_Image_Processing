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

% 將影像直方圖轉為矩陣
hist = transfer(Gray);

% 用 CDF mapping 原直方圖 ---> 新直方圖(矩陣)
new_hist = myHisteq(hist, Gray);

% 將原始圖 mapping 到新圖
output = mapping(hist, Gray);

% show 出結果
figure(3), imshow(output);
figure(4), histogram(output);