clear, clc;

image1 = imread('peppers256.png');
image1 = double(image1);
image2 = imread('cameraman.tif');
image2 = double(image2);
image3 = imread('barbara.bmp');
image3 = double(image3);
image4 = imread('buffalo.tif');
image4 = double(image4);
image5 = imread('caribou.tif');
image5 = double(image5);
image6 = imread('iguana.tif');
image6 = double(image6);
image7 = imread('pelicans.tif');
image7 = double(image7);
image8 = imread('wombats.tif');
image8 = double(image8);
image9 = imread('Lena.png');
image9 = double(image9);

x = [0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.8, 3.2, 3.6, 4.0];
y1 = integration(image1);
y2 = integration(image2);
y3 = integration(image3);
y4 = integration(image4);
y5 = integration(image5);
y6 = integration(image6);
y7 = integration(image7);
y8 = integration(image8);
y9 = integration(image9);

plot(x, y1, '--s', x, y2, '--o', x, y3, '--*', x, y4, '--d', x, y5, '--', x, y6, '--d', x, y7, '--', x, y8, '--');
title('Image Quality Measure(FM) VS Standard Deviation of Gaussian Blur');
legend('Peppers', 'Cameraman', 'Barbara', 'Buffalo', 'Caribou', 'Iguana', 'Pelicans', 'Wombats');
xlabel('Standard Deviation of Gaussian Blur');
ylabel('Image Quality Measure(FM)');
