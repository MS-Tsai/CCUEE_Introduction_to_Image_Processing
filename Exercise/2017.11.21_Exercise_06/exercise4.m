clear all;

image = imread('cameraman.tif');
image = double(image);

output = myImresize(image, 3, 'nearest');