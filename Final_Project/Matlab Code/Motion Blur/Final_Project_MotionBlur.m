clear, clc;

image2 = imread('Lena.png');
image2 = double(image2);

x = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50];

% ===================== IQM ============================
y1 = myMotionBlur(image2, 0);
y2 = myMotionBlur(image2, 45);
y3 = myMotionBlur(image2, 90);
y4 = myMotionBlur(image2, 135);

figure(1), plot(x, y1, x, y2, x, y3, x, y4);
title('Image Quality Measure(FM) VS Number of pixels moved L for different theta');
legend('theta=0', 'theta=45', 'theta=90', 'theta=135');
xlabel('Number of pixels moved L');
ylabel('Image Quality Measure(FM)');

% ===================== JNB ============================
y_JNB_1 = myMotionBlur_JNB(image2, 0);
y_JNB_2 = myMotionBlur_JNB(image2, 45);
y_JNB_3 = myMotionBlur_JNB(image2, 90);
y_JNB_4 = myMotionBlur_JNB(image2, 135);

figure(2), plot(x, y_JNB_1, x, y_JNB_2, x, y_JNB_3, x, y_JNB_4);
title('JNB Measure VS Number of pixels moved L for different theta');
legend('theta=0', 'theta=45', 'theta=90', 'theta=135');
xlabel('Number of pixels moved L');
ylabel('JNB Measure');

% ===================== CPBD ============================
y_CPBD_1 = myMotionBlur_CPBD(image2, 0);
y_CPBD_2 = myMotionBlur_CPBD(image2, 45);
y_CPBD_3 = myMotionBlur_CPBD(image2, 90);
y_CPBD_4 = myMotionBlur_CPBD(image2, 135);

figure(3), plot(x, y_CPBD_1, x, y_CPBD_2, x, y_CPBD_3, x, y_CPBD_4);
title('CPBD Measure VS Number of pixels moved L for different theta');
legend('theta=0', 'theta=45', 'theta=90', 'theta=135');
xlabel('Number of pixels moved L');
ylabel('CPBD Measure');