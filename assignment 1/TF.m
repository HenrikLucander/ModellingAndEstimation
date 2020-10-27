%Assignment1 1b)
A = [-18.2 -5.1 ; 0.3 0];
B = [435.5 ; -36.7];
C = [-0.2 0];
D = 0;

%State space into TF:
[num, den] = ss2tf(A,B,C,D);
tf(num, den)





