function output = myPartialMax(xe, xg_area)
    [row, column] = size(xe);
    output = xe;
    
    for i=2:row-1
        for j=2:column-1
            if xg_area(i, j) == 0
                if xe(i, j)<=xe(i, j-1) || xe(i, j)<=xe(i, j+1)
                    output(i, j) = 0;
                end
            elseif xg_area(i, j) == 1
                if xe(i, j)<=xe(i+1, j-1) || xe(i, j)<=xe(i-1, j+1)
                    output(i, j) = 0;
                end
            elseif xg_area(i, j) == 2
                if xe(i, j)<=xe(i-1, j) || xe(i, j)<=xe(i+1, j)
                    output(i, j) = 0;
                end
            elseif xg_area(i, j) == 3
                if xe(i, j)<=xe(i-1, j-1) || xe(i, j)<=xe(i+1, j+1)
                    output(i, j) = 0;
                end
            end
        end
    end
end