clear all;

image = imread('pout.png');
image = double(image);

R = image(: , : , 1); %���Ximg����R
G = image(: , : , 2); %���Ximg����G
B = image(: , : , 3); %���Ximg����B

Gray = 0.299*R + 0.587*G + 0.114*B; %�m����Ƕ�����
Gray = uint8(Gray);

figure(1), imshow(Gray);
figure(2), histogram(Gray);

% �N�v��������ର�x�}
hist = transfer(Gray);

% �� CDF mapping �쪽��� ---> �s�����(�x�})
new_hist = myHisteq(hist, Gray);

% �N��l�� mapping ��s��
output = mapping(hist, Gray);

% show �X���G
figure(3), imshow(output);
figure(4), histogram(output);