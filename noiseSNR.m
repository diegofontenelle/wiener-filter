function z = noiseSNR(x,SNR)

Px = x'*x;
Px = Px/length(x);%E{x[n]x[n]} 

noise_std = sqrt(Px/(10^(SNR/10)));
z = noise_std * rand(1,length(x));