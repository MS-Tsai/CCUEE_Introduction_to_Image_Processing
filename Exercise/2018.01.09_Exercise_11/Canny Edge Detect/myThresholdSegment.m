function [output_low_T, output_high_T] = myThresholdSegment(xe, xe_max, t1, t2)
    %兩次閾值分割
    [row, column] = size(xe);
    output_low_T = xe_max; % 以t1為閾值分割後的矩陣
    output_high_T = xe_max; % 以t2為閾值分割後的矩陣
    
    for i=2:row-1
        for j=2:column-1
            if xe(i, j) < t1
               output_low_T(i, j)=0;
            end
            
            if xe(i, j) < t2
               output_high_T(i, j)=0;
            end
        end
    end
end