function output = myWiener(input, n)
    % �D�X��Ϫ����B�e�A�ñN��X�x�}�ର�P�j�p���s�x�}
    [row, column] = size(input);
    output = zeros(row, column);
    
    % �M�w�����o�i���j�p
    filter = ones(n, n)/(n*n-1);
    filter(n*floor(n/2)+ceil(n/2)) = 0;
    
    % ���業���o�i�A���G���C�� pixel �P��ƭȪ�������
    input_mean = myFilter2(filter, input, 'zeros');
    
    % �M�w�C�� pixel �P��ƭȪ��ܲ���
    input_variable = myVariable(filter, input);
    n = sum(sum(input_variable))/(row*column);
    
    % ���� Wiener filter (�ھڤ���)
    for i=1:row
        for j=1:column
            output(i, j) = input_mean(i, j) + max(0, input_variable(i, j)-n)*(input(i, j)-input_mean(i, j))/max(input_variable(i, j), n);
        end
    end
end