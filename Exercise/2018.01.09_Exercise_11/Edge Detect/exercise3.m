clear all;

image = imread('ic.tif');
image = double(image);
figure(1), imshow(image/255);

output_p = myEdge(image, 'prewitt');
output_r = myEdge(image, 'roberts');
output_s = myEdge(image, 'sobel');
output_l = myEdge(image, 'laplacian');

figure(2), imshow(output_p/255);
figure(3), imshow(output_r/255);
figure(4), imshow(output_s/255);
figure(5), imshow(mat2gray(output_l)); % temp_last=(temp-min(input))*det, det=1/(max(input)-min(input))