function output = myDerGaussian(n, s)
    % ���ھڰѼƨM�w�o�i���j�p
    output = zeros(1, n);
    total = 0; % total ���֥[��
    
    % ����X�U��m���� (�`�N�y�� , �|�� normalize)
    for x=-floor(n/2):floor(n/2)
        value = (-x/(s^2))*exp(-(x^2)/(2*(s^2))); % �ھڤ�����X�Ӫ���
        output(1, x+ceil(n/2)) = value;
        total = total + value; % �i��֥[
    end
end