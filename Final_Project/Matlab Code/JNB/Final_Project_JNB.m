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

x = [0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.8, 3.2, 3.6, 4.0];
y1 = integration_JNB(image1);
y2 = integration_JNB(image2);
y3 = integration_JNB(image3);
y4 = integration_JNB(image4);
y5 = integration_JNB(image5);
y6 = integration_JNB(image6);
y7 = integration_JNB(image7);
y8 = integration_JNB(image8);

plot(x, y1, '--s', x, y2, '--o', x, y3, '--*', x, y4, '--d', x, y5, '--', x, y6, '--d', x, y7, '--', x, y8, '--');
title('JNB Measure VS Standard Deviation of Gaussian Blur');
legend('Peppers', 'Cameraman', 'Barbara', 'Buffalo', 'Baribou', 'Iguana', 'Pelicans', 'Wombats');
xlabel('Standard Deviation of Gaussian Blur');
ylabel('JNB Measure');
