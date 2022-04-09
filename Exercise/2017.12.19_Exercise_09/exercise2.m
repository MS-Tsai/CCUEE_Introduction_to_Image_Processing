clear all;

image = imread('cameraman.tif');
image = double(image);
figure(1), imshow(image/255);

[row, column] = size(image);
c_row = ceil(row/2);
c_column = ceil(column/2);

image_Log = log(image);

Wr_N = myDFT(size(image, 2));
Wr_M = myDFT(size(image, 1));

temp_NM = Wr_N*image_Log';
Fourier_MN = Wr_M*temp_NM';

shift = [Fourier_MN, Fourier_MN ; Fourier_MN, Fourier_MN];
shift = shift(c_row:(row-1)+c_row, c_column:(column-1)+c_column);

filter = 1.2*myHighButter(shift, 15, 1) + 0.6*myLowButter(shift, 15, 1);
unsharp = filter.*shift;

iWr_N = myIDFT(size(image, 2));
iWr_M = myIDFT(size(image, 1));

itemp_NM = iWr_N*unsharp';
i_Fourier_MN = iWr_M*itemp_NM';

output = exp(abs(i_Fourier_MN));

figure(2), imshow(uint8(output*6));