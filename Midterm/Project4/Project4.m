clear all;

% 讀檔
image = imread('arch.png');
image = double(image);

% 將彩色轉灰階
R = image(: , : , 1); %取出img中的R
G = image(: , : , 2); %取出img中的G
B = image(: , : , 3); %取出img中的B
Gray = 0.299*R + 0.587*G + 0.114*B; %彩色轉灰階公式
figure(1), imshow(Gray/255);

Gray = Gray+1; % 將圖片補1，避免 log(0)的情形

% 決定原圖之長、寬，與其一半之無條件進位值
[row, column] = size(Gray);
c_row = ceil(row/2);
c_column = ceil(column/2);

image_Log = log(Gray); % 將原圖取 log()

% 決定二維 Fourier Transform 矩陣
Wr_N = myDFT(size(Gray, 2));
Wr_M = myDFT(size(Gray, 1));

% 執行二維 Fourier Transform
temp_NM = Wr_N*image_Log';
Fourier_MN = Wr_M*temp_NM';

% 平移 DC 係數
shift = [Fourier_MN, Fourier_MN ; Fourier_MN, Fourier_MN];
shift = shift(c_row:(row-1)+c_row, c_column:(column-1)+c_column);

% 利用 Butterworth 決定濾波器，並執行濾波
filter = 1.2*myHighButter(shift, 15, 1) + 0.6*myLowButter(shift, 15, 1);
high_gain = filter.*shift;

% 決定二維 Inverse Fourier Transform 矩陣
iWr_N = myIDFT(size(Gray, 2));
iWr_M = myIDFT(size(Gray, 1));

% 執行二維 Inverse Fourier Transform
itemp_NM = iWr_N*high_gain';
i_Fourier_MN = iWr_M*itemp_NM';

% 將輸出取 exp() 還原先前的 log()，並 show 出結果
output = exp(abs(i_Fourier_MN));
figure(2), imshow(uint8(output*10));