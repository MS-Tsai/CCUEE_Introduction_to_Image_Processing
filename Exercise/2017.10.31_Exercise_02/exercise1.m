clear all; %clear workspace

img = imread('dog.jpg');
image(img);
img = double(img); %�qunit8��double

R = img(: , : , 1); %���Ximg����R
G = img(: , : , 2); %���Ximg����G
B = img(: , : , 3); %���Ximg����B

img(: , : , 2) = img(: , : , 2).*0; %�h��img������⤸��
img(: , : , 3) = img(: , : , 3).*0; %�h��img�����Ŧ⤸��

imshow(img/255);

Y = 0.299*R + 0.587*G + 0.114*B; %�m����Ƕ�����
figure(1);
imshow(Y./255); %show�e�O�o��255 (0, 255) ---> (0, 1)

%2�i����4�i��
Y0 = mod(Y, 4);
Y1 = mod(floor(Y/4), 4);
Y2 = mod(floor(Y/16), 4);
Y3 = mod(floor(Y/64), 4);

figure(2);
imshow(Y3/3); %show�e�O�o��3 (0, 3) ---> (0, 1)

figure(3);
imshow(floor(Y./2)./127); %128�Ƕ� ---> �C�Ӥ���/2�����=>(0, 127) ---> �A/127=>(0, 1)
figure(4);
imshow(floor(Y./8)./31); %32�Ƕ� ---> �C�Ӥ���/8�����=>(0, 31) ---> �A/31=>(0, 1)
figure(5);
imshow(floor(Y./32)./7); %8�Ƕ� ---> �C�Ӥ���/32�����=>(0, 7) ---> �A/7=>(0, 1)
figure(6);
imshow(floor(Y./128)); %2�Ƕ� ---> �C�Ӥ���/128�����=>(0, 1)

figure(7);
imshow(mix(Y)); %�V��
