clear all;

image = imread('rice.tif');
image = double(image);
figure(1), imshow(image/255);
figure(2), histogram(image);

hist = transfer(image);

within = myWithin(hist);
figure(3), imshow(image > within);
between = myBetween(hist);
figure(4), imshow(image > between);

