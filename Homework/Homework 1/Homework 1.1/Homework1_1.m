matrix = randn(10, 10);
output = matrix;
resultHigh = find(output >= 0.8 & output <= 1);
resultLow = find(output >= 0 & output <= 0.2);

for i=1:size(resultHigh)
    output(resultHigh(i)) = output(resultHigh(i))*(-1);
end

for i=1:size(resultLow)
    output(resultLow(i)) = output(resultLow(i))+1;
end