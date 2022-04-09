% ------------------ output1 is 3*3 -----------------------
origin1 = double(10*magic(5));
filter = ones(3, 3)/9;
output1 = zeros(3, 3);

for i=1:3
    for j=1:3
        output1(i, j) = sum(sum (filter.*origin1(i:i+2, j:j+2)));
    end
end

% ------------------ output2 is 5*5 -----------------------
origin2 = zeros(7, 7);
origin2(2:6, 2:6) = double(10*magic(5));
output2 = zeros(5, 5);

for i=2:6
    for j=2:6
        output2(i-1, j-1) = sum(sum (filter.*origin2(i-1:i+1, j-1:j+1)));
    end
end