function output = myBetween(input)
    normal = input/sum(input);
    level = size(input, 2);
    
    q1 = zeros(1, level);
    u1 = zeros(1, level);
    u2 = zeros(1, level);
    between = zeros(1, level);
    
    coff = [1:level];
    u = sum(coff.*normal);
    
    q1(1) = normal(1);
    u2(1) = u;
    
    for t=1:level-1
        q1(t+1) = q1(t) + normal(t+1);
        
        if(q1(t+1) == 0)
            u1(t+1) = 0;
        else
            u1(t+1) = (q1(t)*u1(t) + (t+1)*normal(t+1))/q1(t+1);
        end
        
        if(q1(t+1) == 1)
            u2(t+1) = 256;
        else
            u2(t+1) = (u-q1(t+1)*u1(t+1))/(1-q1(t+1));
        end
        
        between(t) = q1(t)*(1-q1(t))*((u1(t)-u2(t))^2);
    end
    
    output = find(between == max(between));
    
end