function output = imgrotate(input, degree)
    % 取得原始圖片的長跟寬
    [height, width] = size(input);
    
    % 決定旋轉矩陣與其 inverse
    rotate = [cosd(degree), -sind(degree) ; sind(degree), cosd(degree)];
    i_rotate = [cosd(degree), sind(degree) ; -sind(degree), cosd(degree)];
    
    % 取得旋轉後的四個頂點
    end_point1 = rotate*[width ; height];
    end_point2 = rotate*[1 ; height];
    end_point3 = rotate*[width ; 1];
    end_point4 = rotate*[1 ; 1];
    
    % 找出最上、最下、最左、最右的數值並四捨五入，並決定輸出矩陣大小
    max_i = round(max([end_point1(2), end_point2(2), end_point3(2), end_point4(2)]));
    min_i = round(min([end_point1(2), end_point2(2), end_point3(2), end_point4(2)]));
    max_j = round(max([end_point1(1), end_point2(1), end_point3(1), end_point4(1)]));
    min_j = round(min([end_point1(1), end_point2(1), end_point3(1), end_point4(1)]));
    output = zeros(abs(max_i), abs(max_j-min_j)+1);
    
    row = 1; % 輸出矩陣的列元素索引
    
    for i=max_i:-1:min_i % i 為輸出矩陣元素的列位置 (y 座標)
        column=1; % 輸出矩陣的行元素索引
        
        for j=min_j:1:max_j % j 為輸出矩陣元素的行位置 (x 座標)
            % 將新矩陣逆旋轉回來，並取得其座標
            new_input = i_rotate*[j ; i];
            x = new_input(1);
            y = new_input(2);
            
            % 如果取得之座標，在原始圖片的座標內的話
            if ((x >= 1 && x <= width) && (y >= 1 && y <= height))
                y = -y+height+1; % 將 y 從位置轉回索引
                output = interpolation(input, output, row, column, x, y); % 執行 bilinear 內插
            end
            column = column + 1;
        end
        row = row + 1;
    end
end