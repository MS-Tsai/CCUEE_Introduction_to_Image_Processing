function [output_low_T, output_high_T] = myThresholdSegment(xe, xe_max, t1, t2)
    %�⦸�H�Ȥ���
    [row, column] = size(xe);
    output_low_T = xe_max; % �Ht1���H�Ȥ��Ϋ᪺�x�}
    output_high_T = xe_max; % �Ht2���H�Ȥ��Ϋ᪺�x�}
    
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