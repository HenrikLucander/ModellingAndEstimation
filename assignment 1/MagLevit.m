g = 9.81;
a = 6.66*10^(-3);
L = 0.229;
m = 0.8;
d = 1*10^(-2);
z = d;

syms I
Fm = L/(2*a)*I^2*exp(-z/a)
i_eq = sqrt((2*a*m*g)/(L*exp(-z/a)))

A = [0 1; 1472.975 0];
B = [0; -13.706875];
C = [1 0];
D = 0;

[num,den] = ss2tf(A,B,C,D);
G = tf(num,den)
impulse(G)