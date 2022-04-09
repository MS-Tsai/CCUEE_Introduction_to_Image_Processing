function output = myMatrixProduct(input1, input2)
    [row1,column1] = size(input1);
    [row2,column2] = size(input2);
    
    if column1 == row2
    
        output = zeros(row1, column2);

        for i=1:row1
            for k=1:column2
                for j=1:row2
                    output(i, k) = input1(i, j) * input2(j, k) + output(i, k);
                end
            end
        end
    
    else 
        fprintf('error');
    end
end