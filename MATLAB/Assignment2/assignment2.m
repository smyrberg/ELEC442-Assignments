close all
clear all
clc

%% Coordinate systems
i0 = [1;0;0];
j0 = [0;1;0];
k0 = [0;0;1];
o0 = [0;0;0];
C0 = [i0 j0 k0];

kd = [0.769; 0.401; 0.498];
od = [317; 506; 673];

k6 = kd;

%o4 = [431.8+433.07;149.09;20.32];
o4 = od - 60*k6;

%% Finding theta1
ux = sqrt(o4(1)^2 + o4(2)^2 - 149.09^2);
uy = 149.09;
uz = o4(3);
u = [ux; uy; uz];

theta1 = KahanP2(k0, u, o4);

%% theta3
a_home = 431.8;
b_home = sqrt(433.07^2 + 20.32^2);
c_home = sqrt((433.07+431.8)^2 + 20.30^2);
theta3_offset = KahanP4(a_home, b_home, c_home);

c = sqrt(o4(1)^2 + o4(3)^2); %Projected onto k0-i0 plane
theta3 = KahanP4(a_home, b_home, c) - theta3_offset;

%% theta2
theta2_offset = acos((a_home^2 - b_home^2 + c^2) / (2*a_home*c));
[T1,C01] = DH_homog(theta1, 0, 0, -pi/2);
C1 = C0*C01; i1 = C1(1:3,1); k1 = C1(1:3,3); %Forward kinematics to get i1,k1
theta2 = KahanP2(k1, o4, i1) - theta2_offset;



