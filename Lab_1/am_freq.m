clc;  close all;
N=2048;  % total number of pints to observe the signals
Tmax=1;  % time duration
dt=Tmax/(N-1);  % resolution in time axis
x=0:dt:Tmax;   % time axis   
df=1/dt;       %   frequency resolution
fm=10;            % frequency of the message signal
mi=0.2;             % modulation index;
mt=mi*sin(2*pi*fm*x);  % message signal  
plot(x,mt)
xlabel('time')
ylabel('m(t)')
title('Message signal')

fc=100;    % carrier frequency
ct=sin(2*pi*fc*x);   % carrier signal
figure;
plot(x,ct);
xlabel('time')
ylabel('c(t)')
title('Carrier signal')

%% Conventional AM
amt=ct+ct.*mt;   % conventional amplitude modulated signal
figure;
plot(x,amt);
xlabel('time')
ylabel('am(t)')
title('amplitude modulated signal ')

%% DSB-SC
dsbsct=amt-ct;             % Suppression of the carrier
figure;
plot(x,dsbsct);
xlabel('time')
ylabel('dsbsc(t)')
title('DSB-SC signal ')

%% Frequency Domain Analysis
k=0:N-1;  % bins for frequency  (not actual frequency)
f=k*(df/N);   % frequency axis:  f/df=k/N=>f=k*(df/N)
am_f = abs(fft(amt,N));   % spectrum for amplitude modulated signal
figure; 
plot(f((fc-4*fm)*N/df:(fc+4*fm)*N/df),am_f((fc-4*fm)*N/df:(fc+4*fm)*N/df));
xlabel('frequency (Hz)');
ylabel('| Amplitude |');
title('Freuency domain representation of amplitude modulated waveform');



dsbsc_f =abs(fft(dsbsct,N));   % spectrum for DSB-SC signal
figure; 
plot(f((fc-4*fm)*N/df:(fc+4*fm)*N/df),dsbsc_f((fc-4*fm)*N/df:(fc+4*fm)*N/df));
xlabel('frequency (Hz)');
ylabel('| Amplitude |');
title('Freuency domain representation of DSB-SC waveform');
