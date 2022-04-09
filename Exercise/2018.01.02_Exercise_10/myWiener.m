function output = myWiener(input, n)
    % 求出原圖的長、寬，並將輸出矩陣轉為同大小的零矩陣
    [row, column] = size(input);
    output = zeros(row, column);
    
    % 決定平均濾波器大小
    filter = ones(n, n)/(n*n-1);
    filter(n*floor(n/2)+ceil(n/2)) = 0;
    
    % 執行平均濾波，結果為每個 pixel 周圍數值的平均值
    input_mean = myFilter2(filter, input, 'zeros');
    
    % 決定每個 pixel 周圍數值的變異數
    input_variable = myVariable(filter, input);
    n = sum(sum(input_variable))/(row*column);
    
    % 執行 Wiener filter (根據公式)
    for i=1:row
        for j=1:column
            output(i, j) = input_mean(i, j) + max(0, input_variable(i, j)-n)*(input(i, j)-input_mean(i, j))/max(input_variable(i, j), n);
        end
    end
end