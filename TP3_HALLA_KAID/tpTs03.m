clear all ;
clc ;

fe = 20000;
f = 100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% partie A
% construction du signal :
Te = 1/fe ;
t=0:Te:0.1;
x = 10*cos(2*pi*f*t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% partie B

% la transformée de fourier :
j = 1;
for i=1:length(t)/100
    
    x2=x(j:j+99);
    
    spect1 = abs(fft(x2));
    arg1 = angle(fft(x2));
    spect2(j:j+99)= spect1;
    arg2(j:j+99) = arg1;
    j=j+100;
    
end
freq2 = linspace(-fe/2,fe/2,length(t)-1);

% le spectre : la figure du module + phase 
figure(1);
subplot(1,2,1);
plot(freq2,fftshift(spect1));
subplot(1,2,2);
plot(freq2,fftshift(arg1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% partie C
% la transformé d'ondelette :
coeffs = cwt(x,100,'haar');
figure(2);
plot(t,coeffs);

spect3 = abs(fft(coeffs));
arg3 = angle(fft(coeffs));
freq3 = linspace(-fe/2,fe/2,length(t));

% le spectre : la figure du  module + phase :
figure(3);
subplot(1,2,1);
plot(freq3,fftshift(spect3));
subplot(1,2,2);
plot(freq3,fftshift(arg3));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% partie D
% transformation d'hilbert :
y2 = hilbert(x,length(t));

freq4 = linspace(-fe/2,fe/2,length(t));
spect4 = abs(fft(y2));
arg4 = angle(fft(y2));

% spectre : la figure du module + angle :
figure(4);
subplot(1,2,1);
plot(freq4,fftshift(spect4));
subplot(1,2,2);
plot(freq4,fftshift(arg4));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% partie E

x2 = x + 10*rand(1,length(t));

freq5 = linspace(-fe/2,fe/2,length(t));
spect5 = abs(fft(x2));
arg5 = angle(fft(x2));

% spectre : la figure du module + angle :
figure(5);
subplot(1,2,1);
plot(freq5,fftshift(spect5));
subplot(1,2,2);
plot(freq5,fftshift(arg5));