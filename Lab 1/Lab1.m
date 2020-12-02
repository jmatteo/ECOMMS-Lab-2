%Part 3
snr=10;
t=[0:1/8e3:1.0]';
Ac = 0.5;
Am = 0.5;
fm = 5000;
fc = 25000;
s = Ac*(1+Am*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
%sound(s);

ft = fft(s);

figure(1)
hold on
nexttile
plot(t,imag(ft),'r')
nexttile
plot(t,real(ft),'b')
hold off

%%
%Generate noise
var_s = cov(s);
var_noise=var_s/(10^(snr/10)); 
n=sqrt(var_noise)*randn(length(s),1);
%sound(n)
%Add signal to noise and generate message
m=s+n;
%sound(m)
ftn = fft(m);

figure(2)
hold on
nexttile
plot(t,imag(ftn),'r')
nexttile
plot(t,real(ftn),'b')
hold off

%%
%FM
snr=10;
Bf = 100;
t=[0:1/8e3:1.0]';
Ac = 0.5;
Am = 0.5;
fm = 5000;
fc = 25000;
s = Ac*cos(2*pi*fc*t+Bf*Am*sin(2*pi*fm*t));

%sound(s);

ft = fft(s);

figure(3)
hold on
nexttile
plot(t,imag(ft),'r')
nexttile
plot(t,real(ft),'b')
hold off

var_s = cov(s);
var_noise=var_s/(10^(snr/10)); 
n=sqrt(var_noise)*randn(length(s),1);
%sound(n)
%Add signal to noise and generate message
m=s+n;
%sound(m)
ftn = fft(m);

figure(4)
hold on
nexttile
plot(t,imag(ftn),'r')
nexttile
plot(t,real(ftn),'b')
hold off