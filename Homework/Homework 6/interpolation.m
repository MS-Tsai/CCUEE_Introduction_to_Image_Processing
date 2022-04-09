function output = interpolation(input, origin, row, column, x, y)
    % 取得內插法所需 4個點的位置
    left = floor(x);
    right = ceil(x);
    top = floor(y);
    bottom = ceil(y);
    
    u = x-left; % 根據 bilinear 內插公式，取得 u
    landa = y-top; % 根據 bilinear 內插公式，取得 landa
    
    % 根據 bilinear 內插公式，得到最後結果
    first = double(u*input(top, right) + (1-u)*input(top, left));
    second = double(u*input(bottom, right) + (1-u)*input(bottom, left));
    origin(row, column) = double(landa*second + (1-landa)*first);
    output = origin;
end