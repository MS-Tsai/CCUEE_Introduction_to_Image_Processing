function bigMatrix = copyElement(matrix, p, q)
    bigMatrix = zeros(p*size(matrix, 1), q*size(matrix, 2));
    rowSmall = 1;
    
    for i=1:p*size(matrix, 1)
        columnSmall = 1;
        
        if (rem(i, p) == 1 || p == 1) && i ~= 1
            rowSmall = rowSmall+1;
        end
        
        for j=1:q*size(matrix, 2)
            if (rem(j, q) == 1 || q == 1) && j ~= 1
                columnSmall = columnSmall + 1;
            end
            
            bigMatrix(i, j) = matrix(rowSmall, columnSmall);
        end
    end
end