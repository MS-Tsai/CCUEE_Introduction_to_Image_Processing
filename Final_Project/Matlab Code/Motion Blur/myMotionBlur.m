function output = myMotionBlur(input, theta)
    H = fspecial('motion', 0.1, theta);
    H1 = fspecial('motion', 5, theta);
    H2 = fspecial('motion', 10, theta);
    H3 = fspecial('motion', 15, theta);
    H4 = fspecial('motion', 20, theta);
    H5 = fspecial('motion', 25, theta);
    H6 = fspecial('motion', 30, theta);
    H7 = fspecial('motion', 35, theta);
    H8 = fspecial('motion', 40, theta);
    H9 = fspecial('motion', 45, theta);
    H10 = fspecial('motion', 50, theta);
    
    motion = filter2(H, input, 'same');
    motion1 = filter2(H1, input, 'same');
    motion2 = filter2(H2, input, 'same');
    motion3 = filter2(H3, input, 'same');
    motion4 = filter2(H4, input, 'same');
    motion5 = filter2(H5, input, 'same');
    motion6 = filter2(H6, input, 'same');
    motion7 = filter2(H7, input, 'same');
    motion8 = filter2(H8, input, 'same');
    motion9 = filter2(H9, input, 'same');
    motion10 = filter2(H10, input, 'same');
    
    Fourier = myFFT2(motion);
    Fourier_1 = myFFT2(motion1);
    Fourier_2 = myFFT2(motion2);
    Fourier_3 = myFFT2(motion3);
    Fourier_4 = myFFT2(motion4);
    Fourier_5 = myFFT2(motion5);
    Fourier_6 = myFFT2(motion6);
    Fourier_7 = myFFT2(motion7);
    Fourier_8 = myFFT2(motion8);
    Fourier_9 = myFFT2(motion9);
    Fourier_10 = myFFT2(motion10);

    FM = myImageQualityMeasure(Fourier, input);
    FM_1 = myImageQualityMeasure(Fourier_1, input);
    FM_2 = myImageQualityMeasure(Fourier_2, input);
    FM_3 = myImageQualityMeasure(Fourier_3, input);
    FM_4 = myImageQualityMeasure(Fourier_4, input);
    FM_5 = myImageQualityMeasure(Fourier_5, input);
    FM_6 = myImageQualityMeasure(Fourier_6, input);
    FM_7 = myImageQualityMeasure(Fourier_7, input);
    FM_8 = myImageQualityMeasure(Fourier_8, input);
    FM_9 = myImageQualityMeasure(Fourier_9, input);
    FM_10 = myImageQualityMeasure(Fourier_10, input);
    
    output = [FM, FM_1, FM_2, FM_3, FM_4, FM_5, FM_6, FM_7, FM_8, FM_9, FM_10];
end