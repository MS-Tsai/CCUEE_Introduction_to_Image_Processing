function [output, new_flag] = myFindLine(output_low_T, output_high_T, flag, i, j)
    new_flag = flag;
    new_i = i+1;
    new_j = j+1;
    
    while(i~=new_i || j~=new_j)%若m和n都不發生變化，表明line已到終點
        check = 0;
        
        for x=1:3
            if(check==1)
                break;          
            end
            
            for y=1:3
                if output_low_T(i-2+x, j-2+y) ~= 0
                    output_high_T(i-2+x, j-2+y) = 255;
                    new_i = i-2+x;
                    new_j = j-2+y;%新的[m,n]點
                    new_flag(i, j) = 1;%標記已檢測過
                    check=1;
                    break;
                end
            end
        end
        i = new_i;
        j = new_j;
    end
    output = output_high_T;
end