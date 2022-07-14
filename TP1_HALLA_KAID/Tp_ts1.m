clear all;
clc;

fe = 20000;

%%%%%%%%%%%%%%%%%% partie 1

%creation des signaux
Te = 1/fe;
t=(0:Te:0.5);
x1 = 1*sin(2*pi*100*t);
x2 = 5*cos(2*pi*50*t);
x3 = x1+x2;


figure(1);
subplot(3,1,1);
plot(t,x1,'g');

grid on;
legend('x1');
xlabel('t');
ylabel('amplitude');
title('presentation du signal x1 ');

subplot(3,1,2);
plot(t,x2,'r');

grid on;
legend('x2');
xlabel('t');
ylabel('amplitude');
title('presentation du signal x2 ');

subplot(3,1,3);
plot(t,x3,'b');

grid on;
legend('x1');
xlabel('t');
ylabel('amplitude');
title('presentation du signal x3 : la somme ');

%%%%%%%%%%%%%%%%%% partie 2

% filtre RII 
n1 = [0.9938 -1.89 0.9938]; %numerateur
d1 = [1 -1.89 0.987]; %denomirateur

zero = roots(n1);
pole = roots(d1);

figure(2);
zplane(n1,d1);

% reponse frequentielle 
L = length(t);
[h,w] = freqz(n1,d1,L);
m = abs(h); % module 
p = angle (h); % phase

figure(2);
subplot(2,1,1);
plot(w,(m));
subplot(2,1,2);
plot(w,(p));

% reponse indicielle : 
for i=1 : length(t);
    v(i)=1;
end

Repimp = filter (n1, d1, v);
figure(3);
stem(t,Repimp);

% filtrage du signal x1 :
y1 = filter(n1,d1,x1);
figure(4);
plot(t,y1);




%%%%%%%%%%%%%%%%%% partie 3


% filtre rif
n2 = [0.5 1 0.5];
d2 = 1;

zero = roots(n2);
pole = roots(d2);

figure(5);
zplane(n2,d2);

% reponse frequentielle 
L = length(t);
[h,w] = freqz(n2,d2,L);
m2 = abs(h); % module 
p2 = angle (h); % phase

figure(5);
subplot(2,1,1);
plot(w,(m2));
subplot(2,1,2);
plot(w,(p2));

% reponse impulsionnele 

u(1)=1;
for i=2 : length(t);
    u(i)=0;
end

Repimp = filter (n2, d2, u);
figure(6);
stem(t,Repimp);

% filtrage du signal x2 :
y2 = filter(n2,d2,x2);
figure(7);
plot(t,y2);

