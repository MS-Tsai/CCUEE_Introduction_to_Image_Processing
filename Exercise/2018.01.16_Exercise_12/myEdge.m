function output = myEdge(image, method)
    
    if strcmp(method, 'canny')   
        image = double(image);

        % 決定一維高斯濾波器、一維高斯微分濾波器與兩者 convolution 的結果
        g = myGaussian(3, 2);
        dg = myDerGaussian(3, 2);
        gdg = conv(g, dg);

        % xe 為邊緣影像 (梯度大小)，xg 為梯度方向
        x1 = myFilter2(gdg, image, 'zeros');
        x2 = myFilter2(gdg', image, 'zeros');
        xe = sqrt(x1.^2+x2.^2);
        xg = atan(x2./x1);

        xg_area = myGradientDirection(xg); % 依照梯度方向編號
        xe_max = myPartialMax(xe, xg_area); % 執行非最大值抑制量化，找出局部最大值
        [output_low_T, output_high_T] = myThresholdSegment(xe, xe_max, 0.1, 49); % 執行閥值切割
        output = myFinalCheck(output_low_T, output_high_T); % 根據兩種閥值切割的結果，突顯邊緣的線
        output = output/255;
        output(find(output ~= 1)) = 0;
    end
end