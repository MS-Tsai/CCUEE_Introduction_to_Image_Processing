clear all;

% 讀檔
image = imread('dog.jpg');
image = double(image); % 從 unit8 轉 double
figure(1), imshow(image/255);

% 取出三原色 R G B
R = image(: , : , 1);
G = image(: , : , 2);
B = image(: , : , 3);

% 彩色轉灰階公式
gray = 0.299*R + 0.587*G + 0.114*B;
figure(2), imshow(gray/255);

% 執行混色
output = Diffusion(gray);
output_Jarvis = Diffusion_Jarvis(gray);
output_Stucki = Diffusion_Stucki(gray);

% show 出結果
figure(3), imshow(output);
figure(4), imshow(output_Jarvis);
figure(5), imshow(output_Stucki);

% 分析各 error diffusion 亮暗點數量
analys0 = find(output == 0);
analys255 = find(output == 255);
analys0_Jarvis = find(output_Jarvis == 0);
analys255_Jarvis = find(output_Jarvis == 255);
analys0_Stucki = find(output_Stucki == 0);
analys255_Stucki = find(output_Stucki == 255);

% --------------------- 分析結果 -------------------------
% Floyd-Steinberg 的混色方法
% 因為使用的點較少，因此在較大的影像下，執行速度快而且效果不錯。

% Jarvis-Judice-Ninke 和 Stucki 的混色方法
% 使用了更多的點參與誤差擴散，以得到更好的效果，
% 不過當誤差擴散的範圍變大，需進行大量的整數除法和乘法的運算，導致處理的速度會變慢。
% 因此對於較大的影像而言，一般較少採用這個方法。

% ------------- 三個誤差擴散法的亮暗點比較 ----------------
% 經過測試發現，結果如下：
% 在一般的影像中，三者差異不大
% 在較亮的影像中
%  ---> 暗點數量：Floyd-Steinberg > Jarvis-Judice-Ninke > Stucki
%  ---> 亮點數量：Stucki > Jarvis-Judice-Ninke > Floyd-Steinberg
% 在較暗的影像中
%  ---> 暗點數量：Stucki > Jarvis-Judice-Ninke > Floyd-Steinberg
%  ---> 亮點數量：Floyd-Steinberg > Jarvis-Judice-Ninke > Stucki

% ---------------------- 結論 ---------------------------
% 影像較大時，建議使用 Floyd-Steinberg 誤差擴散法
% 至於 Jarvis-Judice-Ninke 和 Stucki 則可依自己的需求 (需要較亮或較暗的影像) 使用
