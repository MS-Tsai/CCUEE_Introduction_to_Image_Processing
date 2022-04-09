function output = histpwl(input, a, b)
    column = size(a, 2); % a, b �氪���ۦP
    
    % ���X�P input �j�p�ۦP��0�x�}
    height = size(input, 1);
    width = size(input, 2);
    output = zeros(height, width);
    
    for i = 1:column-1
        pix = find(input >= a(i) & input < a(i+1));
        output(pix) = (input(pix)-a(i))*(b(i+1)-b(i))/(a(i+1)-a(i))+b(i); % piecewise linear function ����
    end
end