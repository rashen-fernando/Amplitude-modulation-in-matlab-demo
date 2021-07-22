fm=15000;
fc=250000;
t=0:1/(8*(fm+fc)):8;
m=.5*cos(2*pi*fm*t);
c=1.4*cos(2*pi*fc*t);
s=m.*c;

%demodulation

e=s.*c;
[b,a] = butter(5,2*pi* 2 * 15 * 1000/(8*(fm+fc))) ;

dataOut = filter(b,a,e);


subplot(3,1,1);
%fourier of messege
y=abs(fft(m));
f=0:1/8:4*(fc+fm);
p=y(1:4*(fc+fm)*8+1);
plot(f,p);
title('m(t)');

subplot(3,1,2);
%fourier of modulatedd signal 
my=abs(fft(e));
mp=my(1:4*(fc+fm)*8+1);
plot(f,mp);
title('modulated');

subplot(3,1,3);
%fourier of demodulatedd signal 
dy=abs(fft(dataOut));
dp=dy(1:4*(fc+fm)*8+1);
plot(f,dp);
title('demodulated');
