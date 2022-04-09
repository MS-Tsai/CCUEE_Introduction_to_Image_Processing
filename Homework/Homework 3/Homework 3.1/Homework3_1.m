clear all;

% Initial 原始直方圖的值
hist_a = [20, 40, 60, 75, 80, 75, 65, 55, 50, 45, 40, 35, 30, 25, 20, 30];
hist_b = [0, 0, 40, 80, 45, 110, 70, 0, 0, 0, 0, 0, 0, 0, 0, 15];

% 執行直方圖等化
new_hist_a = myHisteq(hist_a);
new_hist_b = myHisteq(hist_b);