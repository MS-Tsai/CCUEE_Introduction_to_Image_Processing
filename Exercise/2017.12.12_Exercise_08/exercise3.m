clear all;

% ======== 驗證 Superposition Theorem (Linear property) ========

x1 = [1, 1, 1, 1, 1, 1]; % 原始矩陣 1
x2 = [2, 2, 2, 2, 2, 2]; % 原始矩陣 2
transfer = myDFT(6); % 離散傅立葉轉換矩陣

% 先乘倍數相加，再執行 Fourier Transform
x = 2*x1+3*x2; 
X = transfer*x';

% 先執行 Fourier Transform，再乘倍數相加
X1 = transfer*x1';
X2 = transfer*x2';
X_compare = 2*X1+3*X2;