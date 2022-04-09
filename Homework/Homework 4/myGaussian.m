function output = myGaussian(n, s)
    % ���ھڰѼƨM�w�o�i���j�p
    output = zeros(n, n);
    total = 0; % total ���֥[��
    
    % ����X�U��m���� (�`�N�y�� , �|�� normalize)
    for x=-floor(n/2):floor(n/2)
        for y=-floor(n/2):floor(n/2)
            value = exp(-(x*x+y*y)/(2*s*s)); % �ھڤ�����X�Ӫ���
            output(x+ceil(n/2), y+ceil(n/2)) = value;
            total = total + value; % �i��֥[
        end
    end
    
    % �i�� Normalize
    output = output./total;
end