function output = interpolation(input, n, method)
    % 取得原始圖片的長、寬並做出 n 倍大的矩陣
    [row, column] = size(input);
    output = zeros(row*n, column*n);
    
    % 取得原圖的點 在輸出結果上的位置
    new_input_row = double(zeros(row, 1)); % 列位置
    new_input_column = double(zeros(1, column)); % 行位置
    
    for i=1:row
        new_input_row(i) = (i-1)*(row*n-1)/(row-1) + 1;
    end
    
    for i=1:column
        new_input_column(i) = (i-1)*(column*n-1)/(column-1) + 1;
    end
    
    % ======================== 執行內插法 =========================
    if strcmp(method, 'nearest') % 使用 nearest 內插法
        x = 1; % x, y 為原圖的點 在輸出結果上的位置
        
        for i=1:row*n
            y = 1;
            for j=1:column*n
                % 檢查是否為最後一行或最後一列
                if x ~= row || y ~= column
                    if x ~= row
                        if abs(i-new_input_row(x)) > abs(i-new_input_row(x+1))
                            x = x + 1;
                        end
                    end
                    
                    if y ~= column
                        if abs(j-new_input_column(y)) > abs(j-new_input_column(y+1))
                            y = y + 1;
                        end
                    end
                end
                output(i, j) = input(x, y);
            end
        end
    elseif strcmp(method, 'bilinear') % 使用 bilinear 內插法
        for i=1:row*n
            for j=1:column*n
                % 取得內插法所需 4個點的位置
                left = find(new_input_column <= j, 1, 'last');
                right = find(new_input_column > j, 1);
                up = find(new_input_row <= i, 1, 'last');
                bottom = find(new_input_row > i, 1);
                
                % 檢查是否為最後一行或最後一列
                if left == column
                    right = left;
                    u = 0;
                else
                    % 根據 bilinear 內插公式，取得 u
                    u = double((j-new_input_column(left))/(new_input_column(right)-new_input_column(left)));
                end
                
                if up == row
                    bottom = up;
                    landa = 0;
                else
                    % 根據 bilinear 內插公式，取得 landa
                    landa = double((i - new_input_row(up))/(new_input_row(bottom)-new_input_row(up)));
                end
                
                % 根據 bilinear 內插公式，得到最後結果
                first = double(u*input(up, right) + (1-u)*input(up, left));
                second = double(u*input(bottom, right) + (1-u)*input(bottom, left));
                output(i, j) = double(landa*second + (1-landa)*first);
            end
        end
    end
end