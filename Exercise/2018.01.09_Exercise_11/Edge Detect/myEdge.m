function output = myEdge(input, method)
    
    if strcmp(method, 'prewitt')
        prewitt_x = [-1, 0, 1 ; -1, 0, 1 ; -1, 0, 1];
        prewitt_y = [-1, -1, -1 ; 0, 0, 0 ; 1, 1, 1];
        input_x = myFilter2(prewitt_x, input, 'zeros');
        input_y = myFilter2(prewitt_y, input, 'zeros');
        output = sqrt(input_x.^2 + input_y.^2);
        
    elseif strcmp(method, 'roberts')
        roberts_x = [1, 0, 0 ; 0, -1, 0 ; 0, 0, 0];
        roberts_y = [0, 1, 0 ; -1, 0, 0 ; 0, 0, 0];
        input_x = myFilter2(roberts_x, input, 'zeros');
        input_y = myFilter2(roberts_y, input, 'zeros');
        output = sqrt(input_x.^2 + input_y.^2);
        
    elseif strcmp(method, 'sobel')
        sobel_x = [-1, 0, 1 ; -2, 0, 2 ; -1, 0, 1];
        sobel_y = [-1, -2, -1 ; 0, 0, 0 ; 1, 2, 1];
        input_x = myFilter2(sobel_x, input, 'zeros');
        input_y = myFilter2(sobel_y, input, 'zeros');
        output = sqrt(input_x.^2 + input_y.^2);
        
    elseif strcmp(method, 'laplacian')
        filter = [0, 1, 0 ; 1, -4, 1 ; 0, 1, 0];
        output = myFilter2(filter, input, 'zeros');
    end
end