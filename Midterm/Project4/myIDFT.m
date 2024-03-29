function output = myIDFT(N)
    w = exp(2*pi()*sqrt(-1)/N); % w 公式
    parameter = [0:N-1]; % parameter = [0, 1, 2, ..., N-1]
    power = parameter'*parameter; % power 為 n*n 的方陣
    output = (w.^power);
    
    % ================ power ==================
    % [0*0, 0*1, 0*2, 0*3, ..., 0*(N-1), 0*N ;
    %  1*0, 1*1, 1*2, 1*3, ..., 1*(N-1), 1*N ;
    %  2*0, 2*1, 2*2, 2*3, ..., 2*(N-1), 2*N ;
    %   .    .    .    .          .       .  ;
    %   .    .    .    .          .       .  ;
    %   .    .    .    .          .       .  ;
    %  N*0, N*1, N*2, N*3, ..., N*(N-1), N*N]
    
    % ================== output ====================
    % [w^(0*0), w^(0*1), ..., w^(0*(N-1)), w^(0*N) ;
    %  w^(1*0), w^(1*1), ..., w^(1*(N-1)), w^(1*N) ;
    %  w^(2*0), w^(2*1), ..., w^(2*(N-1)), w^(2*N) ;
    %   .    .    .    .          .       .  ;
    %   .    .    .    .          .       .  ;
    %   .    .    .    .          .       .  ;
    %  w^(N*0), w^(N*1), ..., w^(N*(N-1)), w^(N*N)]
end