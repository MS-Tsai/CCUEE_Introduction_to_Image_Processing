function output = myHough2(input)
    % 執行 canny edge detection 找出邊緣圖
    edges = myEdge(input, 'canny');
    
    [x, y] = find(edges);
    angles = [-90:180]*pi/180;
    r = floor(x*cos(angles) + y*sin(angles));
    r_max = max(r(find(r>0)));
    accumulate = zeros(r_max+1, 270);
    
    for i=1:length(x)
        for j=1:270
            if r(i, j) >= 0
                accumulate(r(i, j)+1, j) = accumulate(r(i, j)+1, j)+1;
            end
        end
    end
    
    output = accumulate;
end