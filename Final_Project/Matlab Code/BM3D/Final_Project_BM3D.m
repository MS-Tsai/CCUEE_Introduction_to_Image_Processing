clear, clc;

[noised, de_noised] = BM3D();

imwrite(noised, 'noised.png');
imwrite(de_noised, 'de_noised.png');

Fourier_noised = myFFT2(noised);
Fourier_de_noised = myFFT2(de_noised);

FM_noised = myImageQualityMeasure(Fourier_noised, noised);
FM_de_noised = myImageQualityMeasure(Fourier_de_noised, de_noised);
