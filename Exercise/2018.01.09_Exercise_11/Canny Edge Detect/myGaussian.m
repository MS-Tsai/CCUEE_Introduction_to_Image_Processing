function output = myGaussian(n, s)
    % ���ھڰѼƨM�w�o�i���j�p
    output = zeros(1, n);
    total = 0; % total ���֥[��
    
    % ����X�U��m���� (�`�N�y�� , �|�� normalize)
    for x=-floor(n/2):floor(n/2)
        value = exp(-(x*x)/(2*s*s)); % �ھڤ�����X�Ӫ���
        output(1, x+ceil(n/2)) = value;
        total = total + value; % �i��֥[
    end
end