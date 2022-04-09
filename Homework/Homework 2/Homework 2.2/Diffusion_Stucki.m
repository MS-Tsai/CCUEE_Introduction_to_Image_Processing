function output = Diffusion_Stucki(input)
    % 求出輸入矩陣的長 寬
    height = size(input, 1);
    width = size(input, 2);
    
    output = uint8(zeros(height, width));
    z = zeros(height+3, width+4);
    z(2:height+1, 3:width+2) = input;
    
    for i=2:height+1
        for j=3:width+2
            if z(i, j) < 128
                output(i-1, j-2) = 0;
                E = z(i, j);
            else
                output(i-1, j-2) = 255;
                E = z(i, j)-255;
            end
            
            % 混色 table
            z(i, j+1) = z(i, j+1) + E*8/42;
            z(i, j+2) = z(i, j+2) + E*4/42;
            z(i+1, j-2) = z(i+1, j-2) + E*2/42;
            z(i+1, j-1) = z(i+1, j-1) + E*4/42;
            z(i+1, j) = z(i+1, j) + E*8/42;
            z(i+1, j+1) = z(i+1, j+1) + E*4/42;
            z(i+1, j+2) = z(i+1, j+2) + E*2/42;
            z(i+2, j-2) = z(i+2, j-2) + E*1/42;
            z(i+2, j-1) = z(i+2, j-1) + E*2/42;
            z(i+2, j) = z(i+2, j) + E*4/42;
            z(i+2, j+1) = z(i+2, j+1) + E*2/42;
            z(i+2, j+2) = z(i+2, j+2) + E*1/48;
        end
    end
end