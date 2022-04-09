function output = myMotionBlur_CPBD(input, theta)
    H = fspecial('motion', 0.1, theta);
    H1 = fspecial('motion', 5, theta);
    H2 = fspecial('motion', 10, theta);
    H3 = fspecial('motion', 15, theta);
    H4 = fspecial('motion', 20, theta);
    H5 = fspecial('motion', 25, theta);
    H6 = fspecial('motion', 30, theta);
    H7 = fspecial('motion', 35, theta);
    H8 = fspecial('motion', 40, theta);
    H9 = fspecial('motion', 45, theta);
    H10 = fspecial('motion', 50, theta);
    
    motion = filter2(H, input, 'same');
    motion1 = filter2(H1, input, 'same');
    motion2 = filter2(H2, input, 'same');
    motion3 = filter2(H3, input, 'same');
    motion4 = filter2(H4, input, 'same');
    motion5 = filter2(H5, input, 'same');
    motion6 = filter2(H6, input, 'same');
    motion7 = filter2(H7, input, 'same');
    motion8 = filter2(H8, input, 'same');
    motion9 = filter2(H9, input, 'same');
    motion10 = filter2(H10, input, 'same');

    FM = CPBD_compute(uint8(motion));
    FM_1 = CPBD_compute(uint8(motion1));
    FM_2 = CPBD_compute(uint8(motion2));
    FM_3 = CPBD_compute(uint8(motion3));
    FM_4 = CPBD_compute(uint8(motion4));
    FM_5 = CPBD_compute(uint8(motion5));
    FM_6 = CPBD_compute(uint8(motion6));
    FM_7 = CPBD_compute(uint8(motion7));
    FM_8 = CPBD_compute(uint8(motion8));
    FM_9 = CPBD_compute(uint8(motion9));
    FM_10 = CPBD_compute(uint8(motion10));
    
    output = [FM, FM_1, FM_2, FM_3, FM_4, FM_5, FM_6, FM_7, FM_8, FM_9, FM_10];
end