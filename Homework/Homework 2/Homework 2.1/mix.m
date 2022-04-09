function output = mix(input, Dithering)
    % 取得輸入矩陣的長 寬
    height = size(input, 1);
    width = size(input, 2);
    output = zeros(height, width);
    
    % 取得混色矩陣的長 寬
    height_D = size(Dithering, 1);
    width_D = size(Dithering, 2);
    
    % 做出與 input 矩陣等大的混色矩陣
    Dithering = repmat(Dithering, ceil(height/height_D), ceil(width/width_D));
    Dithering = Dithering(1 : height, 1 : width);
    
    high = find(input > Dithering);
    low = find(input <= Dithering);
    
    output(high) = 1;
    output(low) = 0;
end