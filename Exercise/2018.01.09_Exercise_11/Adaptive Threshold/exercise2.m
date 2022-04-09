clear all;

image = imread('cameraman.tif');
image = double(image);
figure(1), imshow(image/255);

width = size(image, 2);
image1 = image(:, (width*0/4)+1 : width*1/4);
image2 = image(:, (width*1/4)+1 : width*2/4);
image3 = image(:, (width*2/4)+1 : width*3/4);
image4 = image(:, (width*3/4)+1 : width*4/4);

hist1 = transfer(image1);
hist2 = transfer(image2);
hist3 = transfer(image3);
hist4 = transfer(image4);

within1 = myWithin(hist1);
within2 = myWithin(hist2);
within3 = myWithin(hist3);
within4 = myWithin(hist4);
figure(2), imshow([image1>within1, image2>within2, image3>within3, image4>within4]);

within = myWithin(image);
figure(3), imshow(image>within);

% ==================== ½Ò¥»¥´ªk ========================
%c3 = uint8(image);

%p1 = c3(:, 1:64);
%p2 = c3(:, 65:128);
%p3 = c3(:, 129:192);
%p4 = c3(:, 193:256);

%g1 = im2bw(p1, graythresh(p1));
%g2 = im2bw(p2, graythresh(p2));
%g3 = im2bw(p3, graythresh(p3));
%g4 = im2bw(p4, graythresh(p4));
%figure(4), imshow([g1, g2, g3, g4]);
