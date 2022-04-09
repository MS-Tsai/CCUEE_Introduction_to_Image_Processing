clear all;

% Ū��
image = imread('dog.jpg');
image = double(image); % �q unit8 �� double
figure(1), imshow(image/255);

% ���X�T��� R G B
R = image(: , : , 1);
G = image(: , : , 2);
B = image(: , : , 3);

% �m����Ƕ�����
gray = 0.299*R + 0.587*G + 0.114*B;
figure(2), imshow(gray/255);

% �V��x�}
D = [0, 128 ; 192, 64];
D2 = [0, 128, 32, 160 ; 192, 64, 224, 96 ; 48, 176, 16, 144 ; 240, 112, 208, 82];

% ����V��
output = mix(gray, D);
output2 = mix(gray, D2);

% show �X���G
figure(3), imshow(output);
figure(4), imshow(output2);
