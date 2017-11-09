close all
clear variables
clc

%% Task 1
syms s1 s2 s3 theta r11 r22 r33;
s=[s1;s2;s3];
Q = expm(theta*skew(s));
R = diag([r11 r22 r33]);

S = solve([Q(1,1) == R(1,1), Q(2,2) == R(2,2), Q(3,3) == R(3,3)],[s1,s2,s3]);