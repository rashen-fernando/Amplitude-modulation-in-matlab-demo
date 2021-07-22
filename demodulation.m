clear all;

ka=input('ka');
fm=input('fm');
fc=input('fc');
len=10;

t=0:1/(4*(fm+fc)):len;
m=sin(2*pi*fm*t);
c=cos(2*pi*fc*t);
s=(1+ka*m).*c;

%square law demodulator
squared =s.*s;

%filter
order_par=4;
Fpass = fm+(fc-2*fm)/2-(fc-2*fm)/order_par;
Fstop = fm+(fc-2*fm)/2+(fc-2*fm)/order_par;
Ap = 1;
Ast = 30;
Fs = 4*(fm+fc); 
type = 'kaiserwindow';
d = designfilt('lowpassfir','PassbandFrequency',Fpass,'StopbandFrequency',Fstop,'PassbandRipple',Ap,'StopbandAttenuation',Ast,'SampleRate',Fs,'DesignMethod',type);
  
hfvt = fvtool(d);
filt_data=filter(d,squared);
demod_m=sqrt(2*filt_data)-1;

f1=figure;
f2=figure;

figure(f1);
subplot(2,1,1);
plot(t(1:500),demod_m(1:500))

subplot(2,1,2);
plot(t(1:500),m(1:500))

figure(f2);
%fourier of modulatedd signal s
y=abs(fft(demod_m));

%matching lengths of f and y
f=0:1/len:2*(fc+fm);
p=y(1:2*(fc+fm)*len+1);
plot(f,p);

%disp(['type(',type,') Ap(',num2str(Ap),') Ast(',num2str(Ast),') ord(',num2str(order_par),')']);



