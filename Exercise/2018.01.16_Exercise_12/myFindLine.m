function [output, new_flag] = myFindLine(output_low_T, output_high_T, flag, i, j)
    new_flag = flag;
    new_i = i+1;
    new_j = j+1;
    
    while(i~=new_i || j~=new_j)%�Ym�Mn�����o���ܤơA���line�w����I
        check = 0;
        
        for x=1:3
            if(check==1)
                break;          
            end
            
            for y=1:3
                if output_low_T(i-2+x, j-2+y) ~= 0
                    output_high_T(i-2+x, j-2+y) = 255;
                    new_i = i-2+x;
                    new_j = j-2+y;%�s��[m,n]�I
                    new_flag(i, j) = 1;%�аO�w�˴��L
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