clear all;

% Ū��
image = imread('salt-and-pepper.jpg');
image = double(image);

R = image(: , : , 1); %���Ximg����R
G = image(: , : , 2); %���Ximg����G
B = image(: , : , 3); %���Ximg����B

Gray = 0.299*R + 0.587*G + 0.114*B; %�m����Ƕ�����
figure(1), imshow(Gray/255);

% ����i�A���o�i (Wiener filter)�A�� show �X���G
result = myWiener(Gray, 3);
figure(2), imshow(result/255);