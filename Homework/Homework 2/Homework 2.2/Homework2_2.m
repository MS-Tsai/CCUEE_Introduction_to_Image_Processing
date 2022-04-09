clear all;

% Ū��
image = imread('dog.jpg');
image = double(image); % �q unit8 �� double
figure(1), imshow(image/255);

% ���X�T��� R G B
R = image(: , : , 1);
G = image(: , : , 2);
B = image(: , : , 3);

% �m����Ƕ�����
gray = 0.299*R + 0.587*G + 0.114*B;
figure(2), imshow(gray/255);

% ����V��
output = Diffusion(gray);
output_Jarvis = Diffusion_Jarvis(gray);
output_Stucki = Diffusion_Stucki(gray);

% show �X���G
figure(3), imshow(output);
figure(4), imshow(output_Jarvis);
figure(5), imshow(output_Stucki);

% ���R�U error diffusion �G�t�I�ƶq
analys0 = find(output == 0);
analys255 = find(output == 255);
analys0_Jarvis = find(output_Jarvis == 0);
analys255_Jarvis = find(output_Jarvis == 255);
analys0_Stucki = find(output_Stucki == 0);
analys255_Stucki = find(output_Stucki == 255);

% --------------------- ���R���G -------------------------
% Floyd-Steinberg ���V���k
% �]���ϥΪ��I���֡A�]���b���j���v���U�A����t�ק֦ӥB�ĪG�����C

% Jarvis-Judice-Ninke �M Stucki ���V���k
% �ϥΤF��h���I�ѻP�~�t�X���A�H�o���n���ĪG�A
% ���L��~�t�X�����d���ܤj�A�ݶi��j�q����ư��k�M���k���B��A�ɭP�B�z���t�׷|�ܺC�C
% �]�������j���v���Ө��A�@����ֱĥγo�Ӥ�k�C

% ------------- �T�ӻ~�t�X���k���G�t�I��� ----------------
% �g�L���յo�{�A���G�p�U�G
% �b�@�몺�v�����A�T�̮t�����j
% �b���G���v����
%  ---> �t�I�ƶq�GFloyd-Steinberg > Jarvis-Judice-Ninke > Stucki
%  ---> �G�I�ƶq�GStucki > Jarvis-Judice-Ninke > Floyd-Steinberg
% �b���t���v����
%  ---> �t�I�ƶq�GStucki > Jarvis-Judice-Ninke > Floyd-Steinberg
%  ---> �G�I�ƶq�GFloyd-Steinberg > Jarvis-Judice-Ninke > Stucki

% ---------------------- ���� ---------------------------
% �v�����j�ɡA��ĳ�ϥ� Floyd-Steinberg �~�t�X���k
% �ܩ� Jarvis-Judice-Ninke �M Stucki �h�i�̦ۤv���ݨD (�ݭn���G�θ��t���v��) �ϥ�
