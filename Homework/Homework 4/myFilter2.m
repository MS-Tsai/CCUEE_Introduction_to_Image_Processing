function output = myFilter2(filter, image, type)
    [row_filter, column_filter] = size(filter);
    [row_image, column_image] = size(image);
    
    if strcmp(type, 'valid')
        output = zeros(row_image-2*floor(row_filter/2), column_image-2*floor(column_filter/2));
        
        for i=1:row_image-2*floor(row_filter/2)
            for j=1:column_image-2*floor(column_filter/2)
                output(i, j) = sum(sum (filter.*image(i:i+row_filter-1, j:j+column_filter-1)));
            end
        end
    
    elseif strcmp(type, 'zeros')
        new_image = zeros(row_image+2*floor(row_filter/2), column_image+2*floor(column_filter/2));
        new_image(floor(row_filter/2)+1:row_image+floor(row_filter/2) , floor(column_filter/2)+1:column_image+floor(column_filter/2)) = image;
        output = zeros(row_image, column_image);
        
        for i=floor(row_filter/2)+1:row_image+floor(row_filter/2)
            for j=floor(column_filter/2)+1:column_image+floor(column_filter/2)
                output(i-floor(row_filter/2), j-floor(column_filter/2)) = sum(sum (filter.*new_image(i-floor(row_filter/2):i+floor(row_filter/2), j-floor(row_filter/2):j+floor(row_filter/2))));
            end
        end
        
     elseif strcmp(type, 'mirror')
        new_image = [image(floor(row_filter/2):-1:1, :) ; image ; image(row_image:-1:row_image-(floor(row_filter/2)-1), :)];
        new_image = [new_image(:, floor(column_filter/2):-1:1), new_image, new_image(:, column_image:-1:column_image-(floor(column_filter/2)-1))];
        output = zeros(row_image, column_image);
        
        for i=floor(row_filter/2)+1:row_image+floor(row_filter/2)
            for j=floor(column_filter/2)+1:column_image+floor(column_filter/2)
                output(i-floor(row_filter/2), j-floor(column_filter/2)) = sum(sum (filter.*new_image(i-floor(row_filter/2):i+floor(row_filter/2), j-floor(row_filter/2):j+floor(row_filter/2))));
            end
        end
        
     elseif strcmp(type, 'full')
        new_image = zeros(row_image+2*(row_filter-1), column_image+2*(column_filter-1));
        new_image(row_filter:row_image+row_filter-1 , column_filter:column_image+column_filter-1) = image;
        output = zeros(size(new_image, 1)-2*floor(row_filter/2), size(new_image, 2)-2*floor(column_filter/2));
        
        for i=1:size(new_image, 1)-2*floor(row_filter/2)
            for j=1:size(new_image, 2)-2*floor(column_filter/2)
                output(i, j) = sum(sum (filter.*new_image(i:i+row_filter-1, j:j+column_filter-1)));
            end
        end
        
     elseif strcmp(type, 'full_mirror')
        new_image = [image(2*floor(row_filter/2):-1:1, :) ; image ; image(row_image:-1:row_image-(2*floor(row_filter/2)-1), :)];
        new_image = [new_image(:, 2*floor(column_filter/2):-1:1), new_image, new_image(:, column_image:-1:column_image-(2*floor(column_filter/2)-1))];
        output = zeros(size(new_image, 1)-2*floor(row_filter/2), size(new_image, 2)-2*floor(column_filter/2));
        
        for i=1:size(new_image, 1)-2*floor(row_filter/2)
            for j=1:size(new_image, 2)-2*floor(column_filter/2)
                output(i, j) = sum(sum (filter.*new_image(i:i+row_filter-1, j:j+column_filter-1)));
            end
        end
    end
end