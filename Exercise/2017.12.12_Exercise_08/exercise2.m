clear all;

% ======== ���� Frequency domain ���� <---> Time domain * exp() ========

x = [2, 3, 4, 5, 6, 7, 8, 1]; % ��l�x�} (time domain)
x_shift = (-1).^[0:7].*x; % ����x�}�첾 (time domain) 

transfer = myDFT(8); % �����ť߸��ഫ�x�}
i_transfer = myIDFT(8); % �������ť߸��ഫ�x�}

X = transfer*x'; % ���������ť߸��ഫ (time ---> frequency)
X_shift = transfer*x_shift'; % ���������ť߸��ഫ (time ---> frequency)

time_domain = abs(i_transfer*X); % �� amplitude �Y�i (�]�� |exp(j*n*pi())| = 1)
time_shift_domain = abs(i_transfer*X_shift); % �� amplitude �Y�i (�]�� |exp(j*n*pi())| = 1)