function output = mix(input, Dithering)
    % ���o��J�x�}���� �e
    height = size(input, 1);
    width = size(input, 2);
    output = zeros(height, width);
    
    % ���o�V��x�}���� �e
    height_D = size(Dithering, 1);
    width_D = size(Dithering, 2);
    
    % ���X�P input �x�}���j���V��x�}
    Dithering = repmat(Dithering, ceil(height/height_D), ceil(width/width_D));
    Dithering = Dithering(1 : height, 1 : width);
    
    high = find(input > Dithering);
    low = find(input <= Dithering);
    
    output(high) = 1;
    output(low) = 0;
end