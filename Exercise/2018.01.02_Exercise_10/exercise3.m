clear all;

% Ū��
image = imread('salt-and-pepper.jpg');
image = double(image);

R = image(: , : , 1); %���Ximg����R
G = image(: , : , 2); %���Ximg����G
B = image(: , : , 3); %���Ximg����B

image = 0.299*R + 0.587*G + 0.114*B; %�m����Ƕ�����
figure(1), imshow(image/255);

% �M�w�G�� Fourier Transform �x�}
Wr_N = myDFT(size(image, 2));
Wr_M = myDFT(size(image, 1));

% ����G�� Fourier Transform
temp_NM = Wr_N*image';
Fourier_MN = Wr_M*temp_NM';

% ���� DC �Y��
shift = fftshift(Fourier_MN);

% �M�w Butterworth �C�q�o�i���A�ð���
filter = myLowButter(shift, 15, 2);
low_pass = filter.*shift;
figure(2), imshow(log(1+abs(low_pass)));

% ��������o�i
reverse = (shift./filter).*myLowButter(shift, 10, 2);

% �M�w�G�� Inverse Fourier Transform �x�}
iWr_N = myIDFT(size(image, 2));
iWr_M = myIDFT(size(image, 1));

% ����G�� Inverse Fourier Transform
itemp_NM = iWr_N*low_pass';
i_Fourier_MN = iWr_M*itemp_NM';

r_itemp_NM = iWr_N*reverse';
r_i_Fourier_MN = iWr_M*r_itemp_NM';

% �N��X�ର amplitude�A�æL�X���G
output = abs(i_Fourier_MN);
figure(3), imshow(output/max(max(output)));

output_reverse = abs(r_i_Fourier_MN);
figure(4), imshow(output_reverse/max(max(output_reverse)));