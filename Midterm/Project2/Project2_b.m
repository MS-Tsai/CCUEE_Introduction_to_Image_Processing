clear all;

% 讀檔
image = imread('cameraman.png');
image = double(image);
figure(1), imshow(image/255);

% 決定二維 Fourier Transform 矩陣
Wr_N = myDFT(size(image, 2));
Wr_M = myDFT(size(image, 1));

% 執行二維 Fourier Transform
temp_NM = Wr_N*image';
Fourier_MN = Wr_M*temp_NM';

% 平移 DC 係數
shift = [Fourier_MN, Fourier_MN ; Fourier_MN, Fourier_MN];
shift = shift(128:255+128, 128:255+128);

% 決定 Butterworth 低通濾波器，並執行
filter = myLowButter(shift, 15, 1);
low_pass = filter.*shift;
figure(2), imshow(log(1+abs(low_pass)));

% 決定二維 Inverse Fourier Transform 矩陣
iWr_N = myIDFT(size(image, 2));
iWr_M = myIDFT(size(image, 1));

% 執行二維 Inverse Fourier Transform
itemp_NM = iWr_N*low_pass';
i_Fourier_MN = iWr_M*itemp_NM';

% 將輸出轉為 amplitude，並印出結果
output = abs(i_Fourier_MN);
figure(3), imshow(output/max(max(output)));