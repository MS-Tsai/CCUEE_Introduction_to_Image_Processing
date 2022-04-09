function output = myFFT2(input)
    % 決定二維 Fourier Transform 矩陣
    Wr_N = myDFT(size(input, 2));
    Wr_M = myDFT(size(input, 1));

    % 執行二維 Fourier Transform
    temp_NM = Wr_N*input';
    Fourier_MN = Wr_M*temp_NM';
    
    output = fftshift(Fourier_MN);
end