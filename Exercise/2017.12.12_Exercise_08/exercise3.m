clear all;

% ======== ���� Superposition Theorem (Linear property) ========

x1 = [1, 1, 1, 1, 1, 1]; % ��l�x�} 1
x2 = [2, 2, 2, 2, 2, 2]; % ��l�x�} 2
transfer = myDFT(6); % �����ť߸��ഫ�x�}

% �������Ƭۥ[�A�A���� Fourier Transform
x = 2*x1+3*x2; 
X = transfer*x';

% ������ Fourier Transform�A�A�����Ƭۥ[
X1 = transfer*x1';
X2 = transfer*x2';
X_compare = 2*X1+3*X2;