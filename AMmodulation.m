clear;
clc;
ka=input('ka');
fm=input('fm');
fc=input('fc');
len=10;
Fs=(4*(fm+fc));

t=0:1/Fs:len;
m=sin(2*pi*fm*t);
c=cos(2*pi*fc*t);
s=(1+ka*m).*c;

%fourier of modulatedd signal s
y=abs(fft(s));

%matching lengths of f and y
f=0:1/len:2*(fc+fm);
p=y(1:2*(fc+fm)*len+1);

f1=figure;
f2=figure;

figure(f1);
plot(f,p);

figure(f2);
subplot(3,1,1);
plot(t(1:100),m(1:100))
title(['messege fm =',num2str(fm),' '])

subplot(3,1,2);
plot(t(1:100),c(1:100))
title(['carrier fc = ',num2str(fc),' '])

subplot(3,1,3);
plot(t(1:100),s(1:100))
title(['modulated ka =',num2str(ka),' '])

