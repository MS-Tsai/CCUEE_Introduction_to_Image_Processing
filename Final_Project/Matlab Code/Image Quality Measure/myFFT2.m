function output = myFFT2(input)
    % �M�w�G�� Fourier Transform �x�}
    Wr_N = myDFT(size(input, 2));
    Wr_M = myDFT(size(input, 1));

    % ����G�� Fourier Transform
    temp_NM = Wr_N*input';
    Fourier_MN = Wr_M*temp_NM';
    
    output = fftshift(Fourier_MN);
end