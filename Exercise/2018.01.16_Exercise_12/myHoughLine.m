function myHoughLine(image, r, theta)
    [x, y] = size(image);
    angle = pi*(181 - theta)/180;
    
    X = [1:x];
    for i=1:size(r, 1)*size(r, 2);
        if sin(angle) == 0
            figure(1), line([r(i), r(i)], [0, y], 'Color', 'red')
        else
            figure(1), line([0, y], [r(i)/sin(angle(i)), (r(i)-y*cos(angle(i)))/sin(angle(i))], 'Color', 'red')
        end
    end
end