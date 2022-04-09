function output = interpolation(input, origin, row, column, x, y)
    % ���o�����k�һ� 4���I����m
    left = floor(x);
    right = ceil(x);
    top = floor(y);
    bottom = ceil(y);
    
    u = x-left; % �ھ� bilinear ���������A���o u
    landa = y-top; % �ھ� bilinear ���������A���o landa
    
    % �ھ� bilinear ���������A�o��̫ᵲ�G
    first = double(u*input(top, right) + (1-u)*input(top, left));
    second = double(u*input(bottom, right) + (1-u)*input(bottom, left));
    origin(row, column) = double(landa*second + (1-landa)*first);
    output = origin;
end