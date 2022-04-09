function output = myWithin(input)
    level = size(input, 2);
    
    q1 = zeros(1, level);
    q2 = zeros(1, level);
    u1 = zeros(1, level);
    u2 = zeros(1, level);
    var1 = zeros(1, level);
    var2 = zeros(1, level);
    within = zeros(1, level);
    coff = [1:level];
    
    for t=1:level
        q1(t) = sum(input(1:t));
        q2(t) = sum(input(t+1:level));
        
        if(q1(t) == 0)
            u1(t) = 0;
            var1(t) = 0;
        else
            u1(t) = sum((coff(1:t).*input(1:t))/q1(t));
            var1(t) = sum(((coff(1:t)-u1(t)).^2.*input(1:t))/q1(t));
        end
        
        if(q2(t) == 0)
            u2(t) = 0;
            var2(t) = 0;
        else
            u2(t) = sum((coff(t+1:level).*input(t+1:level))/q2(t));
            var2(t) = sum(((coff(t+1:level)-u2(t)).^2.*input(t+1:level))/q2(t));
        end
        
        within(t) = q1(t)*var1(t) + q2(t)*var2(t);
    end
    
    output = find(within == min(within));
end