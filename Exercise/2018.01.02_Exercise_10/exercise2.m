clear all;

% 讀檔
image = imread('salt-and-pepper.jpg');
image = double(image);

R = image(: , : , 1); %取出img中的R
G = image(: , : , 2); %取出img中的G
B = image(: , : , 3); %取出img中的B

Gray = 0.299*R + 0.587*G + 0.114*B; %彩色轉灰階公式
figure(1), imshow(Gray/255);

% 執行可適性濾波 (Wiener filter)，並 show 出結果
result = myWiener(Gray, 3);
figure(2), imshow(result/255);