clear all;
cls ;
Te=0.005;
f1=10;
f2=5;
t=[0:Te:0.2];
x1= 5 + 5 * sin (2*pi*f2* t); %fct sinusoidale 
x2=rectpuls(t,0.05);%fct rect 
x3= sinc(20*f1*t);%fct Sin cardinal 

%affichage dans la meme figure 
figure(1)
subplot(1,3,1)
plot(t,x1);
grid
subplot(1,3,2)
 plot(t,x2);
 grid
subplot(1,3,3)
 plot(t,x3);
 grid  
%produit de convolution entre x1 ET x2
yconv=conv(x1,x2);
t1= 0:Te:(0.2) ;
figure(2)
plot(t1,yconv,'r');
grid 


%correlation entre x2 ET x3
ycor= corr2(x2,x3);
%calcul de transforme de fourier 
spect=abs(fft(x3));
arg= angle(fft(x3));
freq=linspace(-100,100,length(t));
%tracé du spectre 
figure (3)
subplot(1,2,1);
plot(freq,fftshift(spect));
grid
subplot(1,2,2);
plot(freq,arg);
grid 





