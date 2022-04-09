function result = fact(x)
    [row, column] = size(x);
    columnResult = 1;
    
    for i=1:row
        for j=1:column
            boolean = true;
            
            for test=2:sqrt(x(i, j))
                if rem(x(i, j), test) == 0
                    boolean = false;
                    break;
                end
            end
            
            if boolean && x(i, j) ~= 1 && x(i, j) ~= 0
                result(1, columnResult) = x(i, j);
                columnResult = columnResult + 1;
            end
        end
    end
end