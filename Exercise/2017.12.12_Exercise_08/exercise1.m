clear all;

x1 = [1 ; 2 ; 3 ; 4]; % 原始矩陣

transfer = myDFT(4); % 離散傅立葉轉換矩陣
i_transfer = myIDFT(4); % 反離散傅立葉轉換矩陣

X = transfer*x1; % 執行離散傅立葉轉換
x2 = i_transfer*X; % 執行反離散傅立葉轉換