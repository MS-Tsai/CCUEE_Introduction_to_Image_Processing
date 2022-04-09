function output = integration_JNB(input)
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
    
    JNB = JNBM_compute(uint8(input));
    JNB_1 = JNBM_compute(uint8(input_g1));
    JNB_2 = JNBM_compute(uint8(input_g2));
    JNB_3 = JNBM_compute(uint8(input_g3));
    JNB_4 = JNBM_compute(uint8(input_g4));
    JNB_5 = JNBM_compute(uint8(input_g5));
    JNB_6 = JNBM_compute(uint8(input_g6));
    JNB_7 = JNBM_compute(uint8(input_g7));
    JNB_8 = JNBM_compute(uint8(input_g8));
    JNB_9 = JNBM_compute(uint8(input_g9));
    JNB_10 = JNBM_compute(uint8(input_g10));
    
    output = [JNB, JNB_1, JNB_2, JNB_3, JNB_4, JNB_5, JNB_6, JNB_7, JNB_8, JNB_9, JNB_10];
end