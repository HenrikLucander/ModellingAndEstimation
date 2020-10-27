clear all;
close all;
clc;

tspan = [0 10]; % time span : [Tleft Tright]  
init = [0;0;0;0];  % initial consitions : [x1,x2,x3,x4]
m1 = 10;
m2 = 350;
kw = 500000;
ks = 10000;
b = 500;
d = @(t)exp(-t)*sin(t);

% mu = 1;

f = @(t,x) rhs(t,x,m1,m2,kw,ks,b);
[t,x] = ode45(f,tspan,init);

plot(t,x(:,1),'-o',t,x(:,2),'-o');
title('Van der Pol Equation');
xlabel('Time t');
ylabel('Solution x');
legend('x_1','x_2');




