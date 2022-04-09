function output = mapping(input, origin)
    % 先找出原矩陣的大小
    height = size(origin, 1);
    width = size(origin, 2);
    
    % 設定 output 的大小
    table = zeros(1, 20);
    
    sum = 0; % 初始化累加值
    
    for i=1: 20
        sum = sum + input(i);
        table(i) = round(sum*19/(height*width));
    end
    
    T = uint8(table);
    output = T(origin+1);
end