clear all;

x1 = [1, 1, 1, 1, 0, 0, 0, 0]; % 原始矩陣 1
x2 = [2, 2, 2, 2, 0, 0, 0, 0]; % 原始矩陣 2
transfer = myDFT(8); % 離散傅立葉轉換矩陣
i_transfer = myIDFT(8); % 反離散傅立葉轉換矩陣

X1 = transfer*x1';
X2 = transfer*x2';
X = X1.*X2;

x = i_transfer*X;
x_cconvolution = myCconv(x1, x2);