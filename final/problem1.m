%% problem 1
% Henrik Lucander
% 724140
clear all;
close all;

%at t = 0 
%[current in the left loop I1(0)=15A, charge in capacitor q(0)=2A*s]


%constants:
R1 = 4;
R2 = 2;
R3 = 3;
L = 1.6;
C = 0.25;
E = @(t)sin(t);

f = @(t,x) rhs(t,x,R1,R2,R3,L,C);
init = [15;2];
tspan = [0 20];
[t,x] = ode45(f,tspan,init);

plot(t,x(:,1),'-',t,x(:,2),'-')


title('E=sin(t)')
legend('I_1','q')
xlabel('time (s)')
ylabel('A')
