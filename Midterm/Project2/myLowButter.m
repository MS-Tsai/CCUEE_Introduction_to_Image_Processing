function output = myLowButter(input, d, n)
    [height, width] = size(input);
    
    [x, y] = meshgrid(-floor(width/2):floor((width-1)/2), -floor(height/2):floor((height-1)/2));
    
    output = 1./(1+(sqrt(2)-1)*((x.^2+y.^2)/d^2).^n);
end