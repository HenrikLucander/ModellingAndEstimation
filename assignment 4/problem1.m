%% Homework 4
% Henrik Lucander 724140
clear all
close all
% Problem 1
% a)
%making the transfer function:
num = 1;
den = [1 3 2];
H = tf(num,den);

Ts = 1/10; %sample rate of 10Hz
t = 0:Ts:200; %200s time with sampling time as interval
u = idinput(length(t),'prbs'); %pseudorandom binary signal input
y = lsim(H,u,t); %simulating time response of dynamic system

data = iddata(y,u,Ts); %creating an iddata object from the generated signal
figure(1);
plot(data);

% b)
tcorr = -20:Ts:20;
autocorr = xcorr(y,200);
figure(2);
stem(tcorr,autocorr);
ylabel('correlation');
xlabel('time(s)');

% c)
figure(3);
imp = cra(data,100);
t2 = 0:Ts:10;
stem(t2,imp*10);
hold on;
impulse(H,10);
legend('correlation analysis','impulse response');
hold off;

% d)
figure(4);
freq = spa(data);
estEFTE = etfe(data);
bode(freq,estEFTE);
legend({'frequency response estimate','tf EFTE estimate'},'Location','southwest');





