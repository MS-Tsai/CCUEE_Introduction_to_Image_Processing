function result = mix(x)
    %求出輸入矩陣的長、寬
    height = size(x, 1);
    width = size(x, 2);
    
    result = uint8(zeros(height, width));
    z = zeros(height+2, width+2);
    z(2:height+1, 2:width+1) = x;
    
    for i=2:height+1
        for j=2:width+1
            if z(i, j) < 128
                result(i-1, j-1) = 0;
                E = z(i, j);
            else
                result(i-1, j-1) = 255;
                E = z(i, j)-255;
            end
            
            z(i, j+1) = z(i, j+1) + E*8/16;
            z(i+1, j-1) = z(i+1, j-1) + E*4/16;
            z(i+1, j) = z(i+1, j) + E*3/16;
            z(i+1, j+1) = z(i+1, j+1) + E/16;
        end
    end
end