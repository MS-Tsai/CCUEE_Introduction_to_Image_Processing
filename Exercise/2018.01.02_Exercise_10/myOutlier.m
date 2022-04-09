function output = myOutlier(input, n)
    % �M�w�����o�i���j�p
    filter = ones(n, n)/(n*n-1);
    filter(n*floor(n/2)+ceil(n/2)) = 0;
    
    % ���業���o�i�A���G���C�� pixel �P��ƭȪ�������
    input_mean = myFilter2(filter, input, 'zeros');
    
    % �N����ର�@���x�}�èD�X��i�Ϫ��зǮt
    input_one = reshape(input, 1, numel(input));
    d = std(input_one);
    
    % ����[���I (outlier) ��k ... |p-m| > d
    r = abs(input - input_mean) - d > 0;
    output = r.*input_mean+(1-r).*input;
end