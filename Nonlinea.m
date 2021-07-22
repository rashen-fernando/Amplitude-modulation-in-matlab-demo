fm=15000;
fc=250000;
Fs=(8*(fm+fc));
t=0:1/Fs:8;
m=.5*cos(2*pi*fm*t);
c=1.4*cos(2*pi*fc*t);

%modulation
mx1=m+c;
mx2=m-c;
my1 = 2*mx1 + mx1.^2;
my2 = 2*mx2 + mx2.^2;
mz = my1-my2;
[b,a] = butter(3,[2*pi*(fc-fm)/Fs 2*pi*(fc+fm)/Fs],'bandpass') ;
freqz(b,a);
modulated_signal = filter(b,a,mz);

%demodulation
dx1 = modulated_signal+c;
dx2 = modulated_signal-c;
dy1 = 2*dx1 + dx1.^2;
dy2 = 2*dx2 + dx2.^2;
dz  = dy1-dy2;
[c,d] = butter(5,2*pi* 2 * fm/Fs) ;
%freqz(c,d);
demodulated_signal = filter(c,d,dz);


%plot
subplot(3,1,1);
%fourier of messege
y=abs(fft(m));
f=0:1/8:Fs/2;
p=y(1:Fs*8/2+1);
plot(f,p);
title('m(t)');

subplot(3,1,2);
%modulated
my=abs(fft(modulated_signal));
mp=my(1:Fs*8/2+1);
plot(f,mp);
title('modulated');

subplot(3,1,3);
%demodulated
dy=abs(fft(demodulated_signal));
dp=dy(1:Fs*8/2+1);
plot(f,dp);
title('demodulated');
