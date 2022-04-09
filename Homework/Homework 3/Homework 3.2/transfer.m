function output = transfer(input)
    output = zeros(1, 20);
    
    for i=0:19
        strength = find(input == i); % 分別找出(0, 19)各項值的位置(結果為矩陣)
        output(i+1) = size(strength, 1); % 矩陣的大小即為個數
    end
end