function output = myGradientDirection(xg)
    [row, column] = size(xg);
    output = zeros(row, column);
    
    for x=1:row
        for y=1:column
            if xg(x, y) >= 1/4*pi
                output(x, y) = 1;
            else
                if xg(x, y) >= 0
                    output(x, y) = 0;
                else
                    if xg(x, y) >= -1/4*pi
                        output(x, y) = 3;
                    else
                        if xg(x, y) >= -2/4*pi
                            output(x, y) = 2;
                        else
                            output(x, y) = 1;
                        end
                    end
                end
            end
        end
    end
end