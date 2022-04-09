clear all;

%------------- Exercise 1 -----------------
img = imread('pout.tif');
figure(1), imshow(img), figure(2), histogram(img), axis tight; % histogram 為直方圖

img = double(img); % 將 img 從 uint8 轉為 double

% 做出與 img 大小相同的0矩陣
row = size(img, 1);
column = size(img, 2);
img_result = zeros(row, column);

% 執行 Histogram Stretching (先找出三個區段 目前值集中在 (80, 170))
dark = find(img >=0 & img < 80);
middle = find(img >= 80 & img <= 170);
bright = find(img > 170 & img <= 255);

% 分別將三個區段與函式做 mapping
img_result(dark) = img(dark).*0.25;
img_result(middle) = img(middle).*2.33-166.67;
img_result(bright) = img(bright)*0.2941+180;

% 將 img 中的值規範在 (0, 255)
small = find(img_result < 0);
large = find(img_result > 255);
img_result(small) = 0;
img_result(large) = 255;

% show 出結果
figure(3), plot(img, img_result, '.'); % 可比較兩者間的差異 (以方程式作圖呈現)
figure(4), imshow(img_result/255), figure(5), histogram(img_result), axis tight;