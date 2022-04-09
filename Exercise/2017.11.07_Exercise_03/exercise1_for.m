clear all;

%------------- Exercise 1 -----------------
img = imread('pout.tif');
figure(1), imshow(img), figure(2), histogram(img), axis tight; % histogram 為直方圖

img = double(img); % 將 img 從 uint8 轉為 double

% 做出與 img 大小相同的0矩陣
row = size(img, 1);
column = size(img, 2);
img_result = zeros(row, column);

% 以 for 迴圈執行 Histogram Stretching
for i = 1:row
    for j = 1:column
        if img(i, j) >= 80 && img(i, j) <= 170
            img_result(i, j) = (img(i,j)*2.33)-166.67;
        elseif img(i, j) < 80
            img_result(i, j) = (img(i,j)*0.25);
        else
            img_result(i, j) = (img(i,j)*0.2941)+180;
        end
        
        if img_result(i, j) > 255
            img_result(i, j) = 255;
        end
        
        if img_result(i, j) < 0
            img_result(i, j) = 0;
        end
    end
end

% show 出結果
figure(3), plot(img, img_result, '.'); % 可比較兩者間的差異 (以方程式作圖呈現)
figure(4), imshow(img_result/255), figure(5), histogram(img_result), axis tight;

