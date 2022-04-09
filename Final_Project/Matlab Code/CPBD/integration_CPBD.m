function output = integration_CPBD(input)
    input_g1 = imgaussfilt(input, 0.4);
    input_g2 = imgaussfilt(input, 0.8);
    input_g3 = imgaussfilt(input, 1.2);
    input_g4 = imgaussfilt(input, 1.6);
    input_g5 = imgaussfilt(input, 2.0);
    input_g6 = imgaussfilt(input, 2.4);
    input_g7 = imgaussfilt(input, 2.8);
    input_g8 = imgaussfilt(input, 3.2);
    input_g9 = imgaussfilt(input, 3.6);
    input_g10 = imgaussfilt(input, 4.0);
    
    CPBD = CPBD_compute(uint8(input));
    CPBD_1 = CPBD_compute(uint8(input_g1));
    CPBD_2 = CPBD_compute(uint8(input_g2));
    CPBD_3 = CPBD_compute(uint8(input_g3));
    CPBD_4 = CPBD_compute(uint8(input_g4));
    CPBD_5 = CPBD_compute(uint8(input_g5));
    CPBD_6 = CPBD_compute(uint8(input_g6));
    CPBD_7 = CPBD_compute(uint8(input_g7));
    CPBD_8 = CPBD_compute(uint8(input_g8));
    CPBD_9 = CPBD_compute(uint8(input_g9));
    CPBD_10 = CPBD_compute(uint8(input_g10));
    
    output = [CPBD, CPBD_1, CPBD_2, CPBD_3, CPBD_4, CPBD_5, CPBD_6, CPBD_7, CPBD_8, CPBD_9, CPBD_10];
end