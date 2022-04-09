clear all;

% �����X Average filter �� Gaussian filter (�Ҭ��C�q�o�i��)
filter_G1 = myGaussian(21, 0.5);
filter_G2 = myGaussian(3, 0.5);
filter_G3 = myGaussian(21, 2);
filter_A1 = ones(5, 5)/25;
filter_A2 = ones(11, 11)/121;

% Ū��
image = imread('cameraman.tif');
image = double(image);

% ����C�q�o�i
lowPass_A1 = myFilter2(filter_A1, image, 'zeros');
lowPass_A2 = myFilter2(filter_A2, image, 'zeros');
lowPass_G1 = myFilter2(filter_G1, image, 'zeros');
lowPass_G2 = myFilter2(filter_G2, image, 'zeros');
lowPass_G3 = myFilter2(filter_G3, image, 'zeros');

% �N��l�v�� - �����C�q�o�i�᪺�v�� => �h�U�Q��
output_A1 = image - lowPass_A1/1.5;
output_A2 = image - lowPass_A2/1.5;
output_G1 = image - lowPass_G1/1.5;
output_G2 = image - lowPass_G2/1.5;
output_G3 = image - lowPass_G3/1.5;

% show �X���G
figure(1), imshow(output_A1/70);
figure(2), imshow(output_A2/70);
figure(3), imshow(output_G1/70);
figure(4), imshow(output_G2/70);
figure(5), imshow(output_G3/70);