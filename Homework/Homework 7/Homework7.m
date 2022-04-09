clear all;

% ========== Proof Convolution Theorem ============
x1 = [1, 2, 3, 4];
x2 = [1, 2, 3, 4];

% 先執行環形旋積，再執行 Fourier Transform
x_Cconv = myCconv(x1, x2);
X_Cconv = myDFT(x_Cconv');

% 先執行 Fourier Transform，再執行相乘
X1 = myDFT(x1');
X2 = myDFT(x2');
X = X1.*X2;

% ================== Conclusion ===================
% 若使用 myDFT ，則結果會差 N 倍
%  --> X_Cconv = [25 ; -2i ; 1 ; 2i]
%  --> X = [6.25 ; -0.5i ; 0.25 ; 0.5i]

% 若使用 fft() 函式，則結果會相同
%  --> X_Cconv = [100 ; -8i ; 4 ; 8i]
%  --> X = [100 ; -8i ; 4 ; 8i]

% 實驗結果：fft() 函式，最後並不會/N倍
% EX：fft([1, 2, 3, 4]) = [10 ; -2+2i ; -2 ; -2-2i]
%     myDFT([1, 2, 3, 4]) = [10 ; -2+2i ; -2 ; -2-2i]/4
% 因此會導致最後有倍數差異
