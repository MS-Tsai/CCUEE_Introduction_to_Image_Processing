clear all;

% Ū��
image = imread('cameraman.png');
image = double(image);
figure(1), imshow(image/255);

% �M�w�G�� Fourier Transform �x�}
Wr_N = myDFT(size(image, 2));
Wr_M = myDFT(size(image, 1));

% ����G�� Fourier Transform
temp_NM = Wr_N*image';
Fourier_MN = Wr_M*temp_NM';

% ���� DC �Y��
shift = [Fourier_MN, Fourier_MN ; Fourier_MN, Fourier_MN];
shift = shift(128:255+128, 128:255+128);

% �M�w Butterworth �C�q�o�i���A�ð���
filter = myLowButter(shift, 15, 1);
low_pass = filter.*shift;
figure(2), imshow(log(1+abs(low_pass)));

% �M�w�G�� Inverse Fourier Transform �x�}
iWr_N = myIDFT(size(image, 2));
iWr_M = myIDFT(size(image, 1));

% ����G�� Inverse Fourier Transform
itemp_NM = iWr_N*low_pass';
i_Fourier_MN = iWr_M*itemp_NM';

% �N��X�ର amplitude�A�æL�X���G
output = abs(i_Fourier_MN);
figure(3), imshow(output/max(max(output)));