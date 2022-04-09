function output = histpwl(input, a, b)
    column = size(a, 2); % a, b 行高須相同
    
    % 做出與 input 大小相同的0矩陣
    height = size(input, 1);
    width = size(input, 2);
    output = zeros(height, width);
    
    for i = 1:column-1
        pix = find(input >= a(i) & input < a(i+1));
        output(pix) = (input(pix)-a(i))*(b(i+1)-b(i))/(a(i+1)-a(i))+b(i); % piecewise linear function 公式
    end
end