function output = myOutlier(input, n)
    % 決定平均濾波器大小
    filter = ones(n, n)/(n*n-1);
    filter(n*floor(n/2)+ceil(n/2)) = 0;
    
    % 執行平均濾波，結果為每個 pixel 周圍數值的平均值
    input_mean = myFilter2(filter, input, 'zeros');
    
    % 將原圖轉為一維矩陣並求出整張圖的標準差
    input_one = reshape(input, 1, numel(input));
    d = std(input_one);
    
    % 執行歧異點 (outlier) 方法 ... |p-m| > d
    r = abs(input - input_mean) - d > 0;
    output = r.*input_mean+(1-r).*input;
end