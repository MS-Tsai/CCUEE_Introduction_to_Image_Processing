function output = myHisteq(input)
    % 設定 output 的大小
    output = zeros(1, 16);
    
    sum = 0; % Initial sum = 0
    total = 0; % Initial total = 0
    
    % 找出 input 中共有幾個點
    for i=1:16
        total = total + input(i);
    end
    
    for j=1:16
        sum = sum + input(j); % 累加原直方圖的值
        
        % 若 round(sum*15/total)+1 一樣，則應該累加上去
        output(round(sum*15/total)+1) = output(round(sum*15/total)+1) + input(j);
    end
end