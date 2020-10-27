
b=10;
m=0.1;
k=10;
z0=0.2;
g=9.81;
eo=0.0005;
p=0.000015;

T=0:0.1:10;

f=@(T,x) [x(2);-(b*x(2)/m)-(k*(z0-x(1))/m)+(p*((10*sin(10*T))/(x(1)+eo))^2)/m];

initcond=[0.15;0];
timespan=[0 10];
options=odeset('RelTol',1e-6,'AbsTol',1e-6);
[t,x]=ode45(f,timespan,initcond);

plot(t,x(:,1),'-',t,x(:,2),'-')


title('Magnetic suspension system reaction to i=10*sin(10*t)')
legend('x1','x2')
xlabel('time (s)')
ylabel('Position/speed')