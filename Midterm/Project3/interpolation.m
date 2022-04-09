function output = interpolation(input, n, method)
    % ���o��l�Ϥ������B�e�ð��X n ���j���x�}
    [row, column] = size(input);
    output = zeros(row*n, column*n);
    
    % ���o��Ϫ��I �b��X���G�W����m
    new_input_row = double(zeros(row, 1)); % �C��m
    new_input_column = double(zeros(1, column)); % ���m
    
    for i=1:row
        new_input_row(i) = (i-1)*(row*n-1)/(row-1) + 1;
    end
    
    for i=1:column
        new_input_column(i) = (i-1)*(column*n-1)/(column-1) + 1;
    end
    
    % ======================== ���椺���k =========================
    if strcmp(method, 'nearest') % �ϥ� nearest �����k
        x = 1; % x, y ����Ϫ��I �b��X���G�W����m
        
        for i=1:row*n
            y = 1;
            for j=1:column*n
                % �ˬd�O�_���̫�@��γ̫�@�C
                if x ~= row || y ~= column
                    if x ~= row
                        if abs(i-new_input_row(x)) > abs(i-new_input_row(x+1))
                            x = x + 1;
                        end
                    end
                    
                    if y ~= column
                        if abs(j-new_input_column(y)) > abs(j-new_input_column(y+1))
                            y = y + 1;
                        end
                    end
                end
                output(i, j) = input(x, y);
            end
        end
    elseif strcmp(method, 'bilinear') % �ϥ� bilinear �����k
        for i=1:row*n
            for j=1:column*n
                % ���o�����k�һ� 4���I����m
                left = find(new_input_column <= j, 1, 'last');
                right = find(new_input_column > j, 1);
                up = find(new_input_row <= i, 1, 'last');
                bottom = find(new_input_row > i, 1);
                
                % �ˬd�O�_���̫�@��γ̫�@�C
                if left == column
                    right = left;
                    u = 0;
                else
                    % �ھ� bilinear ���������A���o u
                    u = double((j-new_input_column(left))/(new_input_column(right)-new_input_column(left)));
                end
                
                if up == row
                    bottom = up;
                    landa = 0;
                else
                    % �ھ� bilinear ���������A���o landa
                    landa = double((i - new_input_row(up))/(new_input_row(bottom)-new_input_row(up)));
                end
                
                % �ھ� bilinear ���������A�o��̫ᵲ�G
                first = double(u*input(up, right) + (1-u)*input(up, left));
                second = double(u*input(bottom, right) + (1-u)*input(bottom, left));
                output(i, j) = double(landa*second + (1-landa)*first);
            end
        end
    end
end