clear all;

% Initial ��l�Ϥ�
image = [12,  6,  5, 13, 14, 14 ,16, 15;
         11, 10,  8,  5,  8, 11, 14, 14;
          9,  8,  3,  4,  7, 12, 18, 19;
         10,  7,  4,  2, 10, 12, 13, 17;
         16,  9, 13, 13, 16, 19, 19, 17;
         12, 10, 14, 15, 18, 18, 16, 14;
         11,  8, 10, 12, 14, 13, 14, 15;
          8,  6,  3,  7,  9, 11, 12, 12];
      
% �j��N�Ϥ��ର uint8
image = uint8(image);
figure(1), histogram(image);

% �N�v��������ର�x�}
hist = transfer(image);

% �� CDF mapping �쪽��� ---> �s�����(�x�})
new_hist = myHisteq(hist);

% �N��l�� mapping ��s��
new_image = mapping(hist, image);
figure(2), histogram(new_image);
