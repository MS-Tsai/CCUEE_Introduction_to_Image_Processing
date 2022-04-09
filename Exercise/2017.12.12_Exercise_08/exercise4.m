clear all;

x1 = [1, 1, 1, 1, 0, 0, 0, 0]; % ��l�x�} 1
x2 = [2, 2, 2, 2, 0, 0, 0, 0]; % ��l�x�} 2
transfer = myDFT(8); % �����ť߸��ഫ�x�}
i_transfer = myIDFT(8); % �������ť߸��ഫ�x�}

X1 = transfer*x1';
X2 = transfer*x2';
X = X1.*X2;

x = i_transfer*X;
x_cconvolution = myCconv(x1, x2);