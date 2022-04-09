clear all;

% ======== 驗證 Frequency domain 平移 <---> Time domain * exp() ========

x = [2, 3, 4, 5, 6, 7, 8, 1]; % 原始矩陣 (time domain)
x_shift = (-1).^[0:7].*x; % 執行矩陣位移 (time domain) 

transfer = myDFT(8); % 離散傅立葉轉換矩陣
i_transfer = myIDFT(8); % 反離散傅立葉轉換矩陣

X = transfer*x'; % 執行離散傅立葉轉換 (time ---> frequency)
X_shift = transfer*x_shift'; % 執行離散傅立葉轉換 (time ---> frequency)

time_domain = abs(i_transfer*X); % 取 amplitude 即可 (因為 |exp(j*n*pi())| = 1)
time_shift_domain = abs(i_transfer*X_shift); % 取 amplitude 即可 (因為 |exp(j*n*pi())| = 1)