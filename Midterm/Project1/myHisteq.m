function output = myHisteq(input, origin)
    % 先找出原矩陣的大小
    height = size(origin, 1);
    width = size(origin, 2);
    
    % 設定 output 的大小
    output = zeros(1, 256);
    
    sum = 0; % 初始化累加值
    
    for i=1: 256
        sum = sum + input(i); % 累加原直方圖的值

        % 若 round(sum*255/(height*width))+1 一樣，則應該累加上去
        output(round(sum*255/(height*width))+1) = output(round(sum*255/(height*width))+1) + input(i);
    end
end