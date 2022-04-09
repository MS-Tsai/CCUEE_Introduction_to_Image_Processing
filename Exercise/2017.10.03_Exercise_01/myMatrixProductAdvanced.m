function output = myMatrixProductAdvanced(input1, input2)
    [row1,column1] = size(input1);
    [row2,column2] = size(input2);
    
    if column1 == row2
    
        output = zeros(row1, column2);

        for i=1:row1
            for k=1:column2
                output(i, k) = sum(input1(i, :) .* input2(:, k)');
            end
        end
    
    else 
        fprintf('error');
    end
end