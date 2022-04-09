clear all;

% 讀檔
image = imread('salt-and-pepper.jpg');
image = double(image);

R = image(: , : , 1); %取出img中的R
G = image(: , : , 2); %取出img中的G
B = image(: , : , 3); %取出img中的B

image = 0.299*R + 0.587*G + 0.114*B; %彩色轉灰階公式
figure(1), imshow(image/255);

% 決定二維 Fourier Transform 矩陣
Wr_N = myDFT(size(image, 2));
Wr_M = myDFT(size(image, 1));

% 執行二維 Fourier Transform
temp_NM = Wr_N*image';
Fourier_MN = Wr_M*temp_NM';

% 平移 DC 係數
shift = fftshift(Fourier_MN);

% 決定 Butterworth 低通濾波器，並執行
filter = myLowButter(shift, 15, 2);
low_pass = filter.*shift;
figure(2), imshow(log(1+abs(low_pass)));

% 執行反轉濾波
reverse = (shift./filter).*myLowButter(shift, 10, 2);

% 決定二維 Inverse Fourier Transform 矩陣
iWr_N = myIDFT(size(image, 2));
iWr_M = myIDFT(size(image, 1));

% 執行二維 Inverse Fourier Transform
itemp_NM = iWr_N*low_pass';
i_Fourier_MN = iWr_M*itemp_NM';

r_itemp_NM = iWr_N*reverse';
r_i_Fourier_MN = iWr_M*r_itemp_NM';

% 將輸出轉為 amplitude，並印出結果
output = abs(i_Fourier_MN);
figure(3), imshow(output/max(max(output)));

output_reverse = abs(r_i_Fourier_MN);
figure(4), imshow(output_reverse/max(max(output_reverse)));