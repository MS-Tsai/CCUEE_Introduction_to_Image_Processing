function output = myHisteq(input, origin)
    % ����X��x�}���j�p
    height = size(origin, 1);
    width = size(origin, 2);
    
    % �]�w output ���j�p
    output = zeros(1, 256);
    
    sum = 0; % ��l�Ʋ֥[��
    
    for i=1: 256
        sum = sum + input(i); % �֥[�쪽��Ϫ���

        % �Y round(sum*255/(height*width))+1 �@�ˡA�h���Ӳ֥[�W�h
        output(round(sum*255/(height*width))+1) = output(round(sum*255/(height*width))+1) + input(i);
    end
end