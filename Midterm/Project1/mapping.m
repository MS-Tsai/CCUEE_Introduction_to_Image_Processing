function output = mapping(input, origin)
    % ����X��x�}���j�p
    height = size(origin, 1);
    width = size(origin, 2);
    
    % �]�w output ���j�p
    table = zeros(1, 256);
    
    sum = 0; % ��l�Ʋ֥[��
    
    for i=1: 256
        sum = sum + input(i);
        table(i) = round(sum*255/(height*width));
    end
    
    T = uint8(table);
    output = T(origin+1);
end