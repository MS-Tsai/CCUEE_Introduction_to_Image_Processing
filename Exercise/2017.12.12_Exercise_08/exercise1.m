clear all;

x1 = [1 ; 2 ; 3 ; 4]; % ��l�x�}

transfer = myDFT(4); % �����ť߸��ഫ�x�}
i_transfer = myIDFT(4); % �������ť߸��ഫ�x�}

X = transfer*x1; % ���������ť߸��ഫ
x2 = i_transfer*X; % ����������ť߸��ഫ