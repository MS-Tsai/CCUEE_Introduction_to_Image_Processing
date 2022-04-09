function output = myGaussian(n, s)
    % 先根據參數決定濾波器大小
    output = zeros(n, n);
    total = 0; % total 為累加值
    
    % 先算出各位置的值 (注意座標 , 尚未 normalize)
    for x=-floor(n/2):floor(n/2)
        for y=-floor(n/2):floor(n/2)
            value = exp(-(x*x+y*y)/(2*s*s)); % 根據公式算出來的值
            output(x+ceil(n/2), y+ceil(n/2)) = value;
            total = total + value; % 進行累加
        end
    end
    
    % 進行 Normalize
    output = output./total;
end