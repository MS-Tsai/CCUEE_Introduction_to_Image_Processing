clear all;

% Ū��
image = imread('cameraman.tif');
figure(1), imshow(image);
image = double(image);

% �M�w Gaussian �M Laplacian �o�i��
filter_G = myGaussian(3, 2);
filter_L = myLaplacian(0.5);

% ����U���o�i (�o�� type �O�ϥ� zeros)
output_zeros_G = myFilter2(filter_G, image, 'zeros');
output_zeros_L = myFilter2(filter_L, image, 'zeros');

% show �X���G
figure(2), imshow(output_zeros_G/255); % Gaussian Filter �����G�A�ȷ|���b0~255����
figure(3), imshow(output_zeros_L/255); % �i����X��t (���G�j��255���ȧ��|��ܥզ�)

% =============== ���D ====================
% filter_L = myLaplacian(0.5);
% f = fspecial('Laplacian', 0.5);
% ��̥X�Ӫ����G���G���@��
% �Q�_�ݬO���������D�A�S�άO�����i�H�ۤv�q?
