function output = myFinalCheck(output_low_T, output_high_T)
    [row, column] = size(output_low_T);
    flag = zeros(row, column); % �аO���I�O�_�H�˴��L�A1����˴��L
    
    for i=2:row-1
        for j=2:column-1
            if output_high_T(i, j)~=0 && flag(i, j)==0
                [output_high_T, flag] = myFindLine(output_low_T, output_high_T, flag, i, j);
            end
        end
    end
    
    output = output_high_T;
end