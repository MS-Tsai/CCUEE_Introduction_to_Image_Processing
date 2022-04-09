clear all;

image = imread('cameraman.png');
image = double(image);
figure(1), imshow(image/255);

% �M�w Gaussian �o�i��
filter_G = Gaussian(2);

% �����o�i (�o�� type �O�ϥ� zeros)
output_zeros_G = myFilter2(filter_G, image, 'zeros');

% show �X���G
figure(2), imshow(output_zeros_G/255); % Gaussian Filter �����G�A�ȷ|���b0~255����