fm=3000;
fc=250000;

t   = 0:1/(4*(fm+fc)):8;


m=.5*cos(2*pi*fm*t);
c=1.4*cos(2*pi*fc*t);
s=m.*c;
[b,a] = butter(5,2*pi* 2 * 15 * 1000/(8*(fm+fc))) ;

p=[];
for phi=0:pi/50:pi
r=cos(2*pi*fc*t+phi);           %RECIEVER OSCILLATING SIGNAL
e=s.*r;
dataOut = filter(b,a,e);
%p=[p max(dataOut(2000:3000))];
plot(t(1000:2000),dataOut(1000:2000));
hold on;
%legend('phi =',num2str(phi));
%hold on;
end

%h=0:pi/50:pi;
%plot(h,p)






