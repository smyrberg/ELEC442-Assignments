close all
clear all
clc

%% 5d
i = [1;0;0];
j = [0;1;0];
k = [0;0;1];

inputangle = ['1 ';'2 ';'3 ';'4 ';'5 ';'6 '];
theta = [0 0 0 0 0 0];
for n = 1:6
    theta(n) = degtorad(input(inputangle(n)));
end


[T1,C01] = DH_homog(theta(1), 0, 0, -pi/2);
[T2,C12] = DH_homog(theta(2), 0, 431.8, pi);
[T3,C23] = DH_homog(theta(3) + pi/2, -149.09, 20.32, pi/2);
[T4,C34] = DH_homog(theta(4), 433.07, 0, pi/2);
[T5,C45] = DH_homog(theta(5), 0, 0, -pi/2);
[T6,C56] = DH_homog(theta(6), 60, 0, 0);
T= T1*T2*T3*T4*T5*T6;
spy
C0 = eye(3);
C1 = C0*C01;
C2 = C1*C12;
C3 = C2*C23;
C4 = C3*C34;
C5 = C4*C45;

o0 = [0;0;0];
o1 = o0;
o2 = o1 + C1*expm(theta(2)*skew(k))*431.8*i;
o3 = o2 + C2*expm(theta(3)*skew(k))*(-149.09*k + 20.32*j);
o4 = o3 + C3*expm(theta(4)*skew(k))*433.07*k;
o5 = o4;
o6 = o5 + C5*expm(theta(6)*skew(k))*60*k;


x = [o0(1) o1(1) o2(1) o3(1) o4(1) o5(1) o6(1)];
y = [o0(2) o1(2) o2(2) o3(2) o4(2) o5(2) o6(2)];
z = [o0(3) o1(3) o2(3) o3(3) o4(3) o5(3) o6(3)];

figure
    hold on; view(3); grid on;
    plot3(x,y,z, '*');
    xlabel('$x$-coordinate', 'interpreter', 'latex');xlim([-50 1000]);
    ylabel('$y$-coordinate', 'interpreter', 'latex');
    zlabel('$z$-coordinate', 'interpreter', 'latex');zlim([-5 25]);

%% 5e
