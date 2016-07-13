clear
clc

% Params
SNR = 3;
DELAY = 7;

% Loading audio files

male_filepath = 'C:\Users\Thiago\Downloads\Estocasticos\out_male.wav';
female_filepath = 'C:\Users\Thiago\Downloads\Estocasticos\out_female.wav';

male_audio = audioread(male_filepath);
female_audio = audioread(female_filepath);

% Generating noises
male_noise = noiseSNR(male_audio,SNR);
female_noise = noiseSNR(female_audio,SNR);

male_with_noise = male_audio'+male_noise;
female_with_noise = female_audio'+female_noise;

% Calculating w
R = aasamplebiasedautoc(male_with_noise,DELAY);
p = corrcruzada(male_with_noise,male_audio',DELAY);

w = inv(R)*p';

% Filtering the female signal
filtered_female_signal = filter(w,1,female_with_noise);


% Ploting the male signal without any noise
figure(1)
plot(male_audio')
ylabel('dB')
xlabel('Male signal without noise')


% Ploting the male noise
figure(2)
plot(male_noise)
ylabel('dB')
xlabel('Noise generated based on the male audio')

% Ploting the male signal with noise
figure(3)
plot(male_with_noise)
ylabel('dB')
xlabel('Male signal with noise')


% Ploting the female signal without any noise
figure(4)
plot(female_audio')
ylabel('dB')
xlabel('Female signal without noise')


% Ploting the female noise
figure(5)
plot(female_noise)
ylabel('dB')
xlabel('Noise generated based on the female audio')


% Ploting the female signal with noise
figure(6)
plot(female_with_noise)
ylabel('dB')
xlabel('Male signal with noise')


% Ploting the filtered signal using Wiener's filter over the original audio signal without any noise
figure(7)
plot(1:length(female_audio'),female_audio',1:length(female_audio'), filtered_female_signal)
ylabel('dB')
xlabel('Filtered signal over original female signal')

% Calculating the new SNR of the female audio
new_snr = calculoSNR(female_audio, filtered_female_signal');
disp(new_snr)