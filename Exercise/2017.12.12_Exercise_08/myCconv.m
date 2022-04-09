function output = myCconv(a, b)
    if(length(a) ~= length(b))
        error('Vector must be the same length !!!');
    end
    
    la = length(a);
    temp = conv([a, a], b);
    output = temp(la+1:2*la);
end