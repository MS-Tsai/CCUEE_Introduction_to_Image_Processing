clear all;

% ========== Proof Convolution Theorem ============
x1 = [1, 2, 3, 4];
x2 = [1, 2, 3, 4];

% ���������αۿn�A�A���� Fourier Transform
x_Cconv = myCconv(x1, x2);
X_Cconv = myDFT(x_Cconv');

% ������ Fourier Transform�A�A����ۭ�
X1 = myDFT(x1');
X2 = myDFT(x2');
X = X1.*X2;

% ================== Conclusion ===================
% �Y�ϥ� myDFT �A�h���G�|�t N ��
%  --> X_Cconv = [25 ; -2i ; 1 ; 2i]
%  --> X = [6.25 ; -0.5i ; 0.25 ; 0.5i]

% �Y�ϥ� fft() �禡�A�h���G�|�ۦP
%  --> X_Cconv = [100 ; -8i ; 4 ; 8i]
%  --> X = [100 ; -8i ; 4 ; 8i]

% ���絲�G�Gfft() �禡�A�̫�ä��|/N��
% EX�Gfft([1, 2, 3, 4]) = [10 ; -2+2i ; -2 ; -2-2i]
%     myDFT([1, 2, 3, 4]) = [10 ; -2+2i ; -2 ; -2-2i]/4
% �]���|�ɭP�̫ᦳ���Ʈt��
