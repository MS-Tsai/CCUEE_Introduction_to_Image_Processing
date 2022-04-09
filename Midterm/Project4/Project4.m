clear all;

% Ū��
image = imread('arch.png');
image = double(image);

% �N�m����Ƕ�
R = image(: , : , 1); %���Ximg����R
G = image(: , : , 2); %���Ximg����G
B = image(: , : , 3); %���Ximg����B
Gray = 0.299*R + 0.587*G + 0.114*B; %�m����Ƕ�����
figure(1), imshow(Gray/255);

Gray = Gray+1; % �N�Ϥ���1�A�קK log(0)������

% �M�w��Ϥ����B�e�A�P��@�b���L����i���
[row, column] = size(Gray);
c_row = ceil(row/2);
c_column = ceil(column/2);

image_Log = log(Gray); % �N��Ϩ� log()

% �M�w�G�� Fourier Transform �x�}
Wr_N = myDFT(size(Gray, 2));
Wr_M = myDFT(size(Gray, 1));

% ����G�� Fourier Transform
temp_NM = Wr_N*image_Log';
Fourier_MN = Wr_M*temp_NM';

% ���� DC �Y��
shift = [Fourier_MN, Fourier_MN ; Fourier_MN, Fourier_MN];
shift = shift(c_row:(row-1)+c_row, c_column:(column-1)+c_column);

% �Q�� Butterworth �M�w�o�i���A�ð����o�i
filter = 1.2*myHighButter(shift, 15, 1) + 0.6*myLowButter(shift, 15, 1);
high_gain = filter.*shift;

% �M�w�G�� Inverse Fourier Transform �x�}
iWr_N = myIDFT(size(Gray, 2));
iWr_M = myIDFT(size(Gray, 1));

% ����G�� Inverse Fourier Transform
itemp_NM = iWr_N*high_gain';
i_Fourier_MN = iWr_M*itemp_NM';

% �N��X�� exp() �٭���e�� log()�A�� show �X���G
output = exp(abs(i_Fourier_MN));
figure(2), imshow(uint8(output*10));