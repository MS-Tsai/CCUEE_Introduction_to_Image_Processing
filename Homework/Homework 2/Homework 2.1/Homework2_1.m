clear all;

% 讀檔
image = imread('dog.jpg');
image = double(image); % 從 unit8 轉 double
figure(1), imshow(image/255);

% 取出三原色 R G B
R = image(: , : , 1);
G = image(: , : , 2);
B = image(: , : , 3);

% 彩色轉灰階公式
gray = 0.299*R + 0.587*G + 0.114*B;
figure(2), imshow(gray/255);

% 混色矩陣
D = [0, 128 ; 192, 64];
D2 = [0, 128, 32, 160 ; 192, 64, 224, 96 ; 48, 176, 16, 144 ; 240, 112, 208, 82];

% 執行混色
output = mix(gray, D);
output2 = mix(gray, D2);

% show 出結果
figure(3), imshow(output);
figure(4), imshow(output2);
