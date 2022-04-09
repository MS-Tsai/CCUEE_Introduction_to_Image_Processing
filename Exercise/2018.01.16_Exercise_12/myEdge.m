function output = myEdge(image, method)
    
    if strcmp(method, 'canny')   
        image = double(image);

        % �M�w�@�������o�i���B�@�������L���o�i���P��� convolution �����G
        g = myGaussian(3, 2);
        dg = myDerGaussian(3, 2);
        gdg = conv(g, dg);

        % xe ����t�v�� (��פj�p)�Axg ����פ�V
        x1 = myFilter2(gdg, image, 'zeros');
        x2 = myFilter2(gdg', image, 'zeros');
        xe = sqrt(x1.^2+x2.^2);
        xg = atan(x2./x1);

        xg_area = myGradientDirection(xg); % �̷ӱ�פ�V�s��
        xe_max = myPartialMax(xe, xg_area); % ����D�̤j�ȧ��q�ơA��X�����̤j��
        [output_low_T, output_high_T] = myThresholdSegment(xe, xe_max, 0.1, 49); % ����֭Ȥ���
        output = myFinalCheck(output_low_T, output_high_T); % �ھڨ�ػ֭Ȥ��Ϊ����G�A������t���u
        output = output/255;
        output(find(output ~= 1)) = 0;
    end
end