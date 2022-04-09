function output = myImageQualityMeasure(input, origin)
    [height, width] = size(origin);
    
    AF = abs(input);
    M = max(max(AF));
    threshold = M/1000;
    TH = size(find(abs(input) > threshold), 1);
    output = TH/(height*width);
end