close all
clear variables
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

o4 = [431.8+433.07;149.09;20.32];
%o4 = od - 60*k6;

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

c = sqrt(o4(1)^2 + o4(3)^2); %Projected onto i1-j1 plane
theta3 = KahanP4(a_home, b_home, c) - theta3_offset;

%% theta2
theta2_offset = acos((a_home^2 - b_home^2 + c^2) / (2*a_home*c));
[T1,C01] = DH_homog(theta1, 0, 0, -pi/2);
C1 = C0*C01; i1 = C1(1:3,1); k1 = C1(1:3,3); %Forward kinematics to get i1,k1
theta2 = KahanP2(k1, o4, i1) - theta2_offset;

%% theta4 and theta6, how it could look
[T2,C12] = DH_homog(theta2, 0, 431.8, pi);
[T3,C23] = DH_homog(theta3 + pi/2, -149.09, 20.32, pi/2);
C3 = C3*C12*C23; %Forward kinematics to find base frame C3
i3 = C3(1:3,1); j3 = C3(1:3,2); k3 = C3(1:3, 3); 

k4 = cross(k3, kd)/norm(cross(k3,kd));

theta4 = KahanP2(k3, j3, k4) - pi; %Subtract pi because of orientation
theta6 = KahanP2(-kd, jd, k4) + pi;
theta5 = KahanP2(k4, k3, kd);


