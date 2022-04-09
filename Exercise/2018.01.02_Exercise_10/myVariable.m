function output = myVariable(filter, input)
    [filter_r, filter_c] = size(filter);
    [input_r, input_c] = size(input);
    
    filter_r_f = floor(filter_r/2);
    filter_c_f = floor(filter_c/2);
    
    input_zeros = zeros(input_r+2*filter_r_f, input_c+2*filter_c_f);
    input_zeros(filter_r_f+1:input_r+filter_r_f , filter_c_f+1:input_c+filter_c_f) = input;
    output = zeros(input_r, input_c);
    
    for i=filter_r_f+1:input_r+filter_r_f
        for j=filter_c_f+1:input_c+filter_c_f
            input_pixel = input_zeros(i-filter_r_f:i+filter_r_f, j-filter_c_f:j+filter_c_f);
            input_pixel_one = reshape(input_pixel, 1, numel(input_pixel));
            output(i-filter_r_f, j-filter_c_f) = var(input_pixel_one);
        end
    end
end