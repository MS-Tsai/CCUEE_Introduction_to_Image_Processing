clear all;

% Ū��
image = imread('cameraman.tif');
image = double(image);
figure(1), imshow(image/255);

% �����X Average filter
filter = ones(3, 3)/9;

% �� Maximum/Minimum/Median filter �����o�i
output_max = nlfilter_max(filter, image, 'zeros');
output_min = nlfilter_min(filter, image, 'zeros');
output_median = nlfilter_median(filter, image, 'zeros');

% show �X���G
figure(2), imshow(output_max/255);
figure(3), imshow(output_min/255);
figure(4), imshow(output_median/255);