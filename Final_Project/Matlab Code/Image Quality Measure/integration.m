function output = integration(input)
    input_g1 = imgaussfilt(input, 0.4);
    input_g2 = imgaussfilt(input, 0.8);
    input_g3 = imgaussfilt(input, 1.2);
    input_g4 = imgaussfilt(input, 1.6);
    input_g5 = imgaussfilt(input, 2.0);
    input_g6 = imgaussfilt(input, 2.4);
    input_g7 = imgaussfilt(input, 2.8);
    input_g8 = imgaussfilt(input, 3.2);
    input_g9 = imgaussfilt(input, 3.6);
    input_g10 = imgaussfilt(input, 4.0);

    Fourier = myFFT2(input);
    Fourier_1 = myFFT2(input_g1);
    Fourier_2 = myFFT2(input_g2);
    Fourier_3 = myFFT2(input_g3);
    Fourier_4 = myFFT2(input_g4);
    Fourier_5 = myFFT2(input_g5);
    Fourier_6 = myFFT2(input_g6);
    Fourier_7 = myFFT2(input_g7);
    Fourier_8 = myFFT2(input_g8);
    Fourier_9 = myFFT2(input_g9);
    Fourier_10 = myFFT2(input_g10);

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