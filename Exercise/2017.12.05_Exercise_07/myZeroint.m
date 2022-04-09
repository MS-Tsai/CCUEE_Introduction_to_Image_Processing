function output = myZeroint(input, k)
    % 取得原圖的長跟寬
    [m, n] = size(input);
    
    % 執行放大 3 倍的零交錯
    input2 = reshape([input ; zeros(m, n) ; zeros(m, n)], m, k*n);
    output = reshape([input2' ; zeros(k*n, m) ; zeros(k*n, m)], k*n, k*m)';
end