function output = Gaussian(s)
    % ���ھڰѼƨM�w�o�i���j�p
    output = zeros(5, 5);
    total = 0; % total ���֥[��
    
    % ����X�U��m���� (�`�N�y�� , �|�� normalize)
    for x=-floor(5/2):floor(5/2)
        for y=-floor(5/2):floor(5/2)
            value = exp(-(x*x+y*y)/(2*s*s)); % �ھڤ�����X�Ӫ���
            output(x+ceil(5/2), y+ceil(5/2)) = value;
            total = total + value; % �i��֥[
        end
    end
    
    % �i�� Normalize
    output = output/total;
end