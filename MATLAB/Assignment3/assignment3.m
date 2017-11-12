close all
clear variables
clc

%% Task 1
syms s1 s2 s3 theta r11 r22 r33;
s=[s1;s2;s3];
Q = expm(theta*skew(s));
R = diag([r11 r22 r33]);

S = solve([Q(1,1) == R(1,1), Q(2,2) == R(2,2), Q(3,3) == R(3,3)],[s1,s2,s3]);

%% Task 2

theta_init = deg2rad([0 0 90 0 90 0]);
d_init = [0 0 -149.09 433.07 0 60];
a_init = [0 431.80 20.32 0 0 0];
alpha_init = deg2rad([-90 180 90 90 -90 0]);

k_d_in = input('Input desired k_d'); k_d = k_d_in/norm(k_d_in);
j_d_in = input('Input desired j_d');  j_d = j_d_in/norm(j_d_in);
while k_d'*j_d ~= 0
    disp('k_d and j_d not orthogonal, try again');
    j_d_in = input('Input desired j_d');  j_d = j_d_in/norm(j_d_in);
end
i_d = cross(j_d, k_d)/norm(cross(j_d, k_d));


for n = 1:6
    [T(n), Q(n)] = DH_homog(theta_init(n), d_init(n), alpha_init(n));
end
%% Test

for n = 1:3
    c(n) = n;
end
c = c';

