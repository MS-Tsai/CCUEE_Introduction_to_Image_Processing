function output = imgrotate(input, degree)
    % ���o��l�Ϥ�������e
    [height, width] = size(input);
    
    % �M�w����x�}�P�� inverse
    rotate = [cosd(degree), -sind(degree) ; sind(degree), cosd(degree)];
    i_rotate = [cosd(degree), sind(degree) ; -sind(degree), cosd(degree)];
    
    % ���o����᪺�|�ӳ��I
    end_point1 = rotate*[width ; height];
    end_point2 = rotate*[1 ; height];
    end_point3 = rotate*[width ; 1];
    end_point4 = rotate*[1 ; 1];
    
    % ��X�̤W�B�̤U�B�̥��B�̥k���ƭȨå|�ˤ��J�A�èM�w��X�x�}�j�p
    max_i = round(max([end_point1(2), end_point2(2), end_point3(2), end_point4(2)]));
    min_i = round(min([end_point1(2), end_point2(2), end_point3(2), end_point4(2)]));
    max_j = round(max([end_point1(1), end_point2(1), end_point3(1), end_point4(1)]));
    min_j = round(min([end_point1(1), end_point2(1), end_point3(1), end_point4(1)]));
    output = zeros(abs(max_i), abs(max_j-min_j)+1);
    
    row = 1; % ��X�x�}���C��������
    
    for i=max_i:-1:min_i % i ����X�x�}�������C��m (y �y��)
        column=1; % ��X�x�}���椸������
        
        for j=min_j:1:max_j % j ����X�x�}���������m (x �y��)
            % �N�s�x�}�f����^�ӡA�è��o��y��
            new_input = i_rotate*[j ; i];
            x = new_input(1);
            y = new_input(2);
            
            % �p�G���o���y�СA�b��l�Ϥ����y�Ф�����
            if ((x >= 1 && x <= width) && (y >= 1 && y <= height))
                y = -y+height+1; % �N y �q��m��^����
                output = interpolation(input, output, row, column, x, y); % ���� bilinear ����
            end
            column = column + 1;
        end
        row = row + 1;
    end
end