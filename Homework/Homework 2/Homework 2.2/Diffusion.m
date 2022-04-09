function output = Diffusion(input)
    % 求出輸入矩陣的長 寬
    height = size(input, 1);
    width = size(input, 2);
    
    output = uint8(zeros(height, width));
    z = zeros(height+2, width+2);
    z(2:height+1, 2:width+1) = input;
    
    for i=2:height+1
        for j=2:width+1
            if z(i, j) < 128
                output(i-1, j-1) = 0;
                E = z(i, j);
            else
                output(i-1, j-1) = 255;
                E = z(i, j)-255;
            end
            
            % 混色 table
            z(i, j+1) = z(i, j+1) + E*8/16;
            z(i+1, j-1) = z(i+1, j-1) + E*4/16;
            z(i+1, j) = z(i+1, j) + E*3/16;
            z(i+1, j+1) = z(i+1, j+1) + E/16;
        end
    end
end