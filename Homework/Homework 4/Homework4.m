clear all;

% 讀檔
image = imread('cameraman.tif');
figure(1), imshow(image);
image = double(image);

% 決定 Gaussian 和 Laplacian 濾波器
filter_G = myGaussian(3, 2);
filter_L = myLaplacian(0.5);

% 執行各式濾波 (這邊 type 是使用 zeros)
output_zeros_G = myFilter2(filter_G, image, 'zeros');
output_zeros_L = myFilter2(filter_L, image, 'zeros');

% show 出結果
figure(2), imshow(output_zeros_G/255); % Gaussian Filter 的結果，值會落在0~255之間
figure(3), imshow(output_zeros_L/255); % 可突顯出邊緣 (結果大於255的值均會顯示白色)

% =============== 問題 ====================
% filter_L = myLaplacian(0.5);
% f = fspecial('Laplacian', 0.5);
% 兩者出來的結果似乎不一樣
% 想起問是公式有問題，又或是公式可以自己訂?
