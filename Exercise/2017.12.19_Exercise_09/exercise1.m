clear all;

image = imread('cameraman.tif');
image = double(image);

Wr_N = myDFT(size(image, 2));
Wr_M = myDFT(size(image, 1));

temp_NM = Wr_N*image';
output_MN = Wr_M*temp_NM';

a = abs(output_MN);

shift = [output_MN, output_MN ; output_MN, output_MN];
shift = shift(128:255+128, 128:255+128);

figure(1), imshow(log(1+abs(shift)));

iWr_N = myIDFT(size(image, 2));
iWr_M = myIDFT(size(image, 1));

itemp_NM = iWr_N*output_MN';
origin_MN = iWr_M*itemp_NM';

figure(2), imshow(abs(origin_MN)/255);

