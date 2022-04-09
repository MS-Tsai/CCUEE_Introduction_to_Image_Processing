function output = myDerGaussian(n, s)
    % 先根據參數決定濾波器大小
    output = zeros(1, n);
    total = 0; % total 為累加值
    
    % 先算出各位置的值 (注意座標 , 尚未 normalize)
    for x=-floor(n/2):floor(n/2)
        value = (-x/(s^2))*exp(-(x^2)/(2*(s^2))); % 根據公式算出來的值
        output(1, x+ceil(n/2)) = value;
        total = total + value; % 進行累加
    end
end