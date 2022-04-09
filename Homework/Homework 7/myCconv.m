function output = myCconv(input1, input2)
    if(length(input1) ~= length(input2))
        error('Vector must be the same length !!!');
    end
    
    la = length(input1);
    temp = conv([input1, input1], input2);
    output = temp(la+1:2*la);
end