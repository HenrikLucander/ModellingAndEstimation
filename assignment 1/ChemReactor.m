V = 12;
q = 0.15;
k = 9.4;
E = 2500;
R = 8.31;
T = 293;

A = [-(q+V*k*exp(-E/(R*T))/V) 0; k*exp(-E/(R*T)) -q/V];
B = [q/V; 0];
C = [1 0; 0 1];
D = [0;0];

sys = ss(A,B,C,D);
step(sys)
