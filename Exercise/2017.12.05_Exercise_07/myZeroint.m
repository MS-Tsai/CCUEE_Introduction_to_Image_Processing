function output = myZeroint(input, k)
    % ���o��Ϫ�����e
    [m, n] = size(input);
    
    % �����j 3 �����s���
    input2 = reshape([input ; zeros(m, n) ; zeros(m, n)], m, k*n);
    output = reshape([input2' ; zeros(k*n, m) ; zeros(k*n, m)], k*n, k*m)';
end