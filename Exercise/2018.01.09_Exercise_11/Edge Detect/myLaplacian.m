function output = myLaplacian(a)
    % �ھڤ����M�w�o�i��
    output = [-a, a-1, -a ; a-1, a+5, a-1 ; -a, a-1, -a]./(a+1);
end