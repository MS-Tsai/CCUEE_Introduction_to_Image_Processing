clear all; %clear workspace

img = imread('dog.jpg');
image(img);
img = double(img); %從unit8轉double

R = img(: , : , 1); %取出img中的R
G = img(: , : , 2); %取出img中的G
B = img(: , : , 3); %取出img中的B

img(: , : , 2) = img(: , : , 2).*0; %去除img中的綠色元素
img(: , : , 3) = img(: , : , 3).*0; %去除img中的藍色元素

imshow(img/255);

Y = 0.299*R + 0.587*G + 0.114*B; %彩色轉灰階公式
figure(1);
imshow(Y./255); %show前記得除255 (0, 255) ---> (0, 1)

%2進制轉4進制
Y0 = mod(Y, 4);
Y1 = mod(floor(Y/4), 4);
Y2 = mod(floor(Y/16), 4);
Y3 = mod(floor(Y/64), 4);

figure(2);
imshow(Y3/3); %show前記得除3 (0, 3) ---> (0, 1)

figure(3);
imshow(floor(Y./2)./127); %128灰階 ---> 每個元素/2取整數=>(0, 127) ---> 再/127=>(0, 1)
figure(4);
imshow(floor(Y./8)./31); %32灰階 ---> 每個元素/8取整數=>(0, 31) ---> 再/31=>(0, 1)
figure(5);
imshow(floor(Y./32)./7); %8灰階 ---> 每個元素/32取整數=>(0, 7) ---> 再/7=>(0, 1)
figure(6);
imshow(floor(Y./128)); %2灰階 ---> 每個元素/128取整數=>(0, 1)

figure(7);
imshow(mix(Y)); %混色
