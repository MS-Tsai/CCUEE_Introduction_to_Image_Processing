function output = transfer(input)
    output = zeros(1, 256);
    
    for i=0:255
        strength = find(input == i); % ���O��X(0, 255)�U���Ȫ���m(���G���x�})
        output(i+1) = size(strength, 1); % �x�}���j�p�Y���Ӽ�
    end
end