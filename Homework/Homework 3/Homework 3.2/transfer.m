function output = transfer(input)
    output = zeros(1, 20);
    
    for i=0:19
        strength = find(input == i); % ���O��X(0, 19)�U���Ȫ���m(���G���x�})
        output(i+1) = size(strength, 1); % �x�}���j�p�Y���Ӽ�
    end
end