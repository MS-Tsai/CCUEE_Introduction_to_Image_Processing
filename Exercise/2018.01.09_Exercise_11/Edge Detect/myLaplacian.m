function output = myLaplacian(a)
    % 根據公式決定濾波器
    output = [-a, a-1, -a ; a-1, a+5, a-1 ; -a, a-1, -a]./(a+1);
end