function output = myHisteq(input)
    % �]�w output ���j�p
    output = zeros(1, 16);
    
    sum = 0; % Initial sum = 0
    total = 0; % Initial total = 0
    
    % ��X input ���@���X���I
    for i=1:16
        total = total + input(i);
    end
    
    for j=1:16
        sum = sum + input(j); % �֥[�쪽��Ϫ���
        
        % �Y round(sum*15/total)+1 �@�ˡA�h���Ӳ֥[�W�h
        output(round(sum*15/total)+1) = output(round(sum*15/total)+1) + input(j);
    end
end