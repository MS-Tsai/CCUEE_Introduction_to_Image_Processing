function output = myImresize(input, k, type)
    [row, column] = size(input);
    output = zeros(row*k, column*k);
    
    if strcmp(type, 'nearest')
        for i=1:row*k
            for j=1:column*k
                output(i, j) = input(ceil(i/k), ceil(j/k));
            end
        end
    elseif strcmp(type, 'bilinear')
        
    end
end