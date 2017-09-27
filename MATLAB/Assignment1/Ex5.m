close all 
clear all
clc

%% 5d
<<<<<<< HEAD
angle = ['1 '; 
     '2 '; 
     '3 '; 
     '4 '; 
     '5 '; 
     '6 '];
theta = [0 0 0 0 0 0];
for i = 1:6
    theta(i) = degtorad(input(angle(i)));
end
=======
angle1 = 'Type the first joint angle in degrees: ';
angle2 = 'And now the second: ';
angle3 = 'Third: ';
angle4 = 'Fourth: ';
angle5 = 'Fifth: ';
angle6 = 'Sixth: ';
>>>>>>> 8f88e1649e88ea4f198fa109130a23baae9acb95

T1 = DH_homog(theta(1), 0, 0, -pi/2);
T2 = DH_homog(theta(2), 0, 431.8, pi);
T3 = DH_homog(theta(3) + pi/2, -149.09, 20.32, pi/2);
T4 = DH_homog(theta(4), 433.07, 0, pi/2);
T5 = DH_homog(theta(5), 0, 0, -pi/2);
T6 = DH_homog(theta(6), 60, 0, 0);

o0 = [0;0;0];
v1 = T1*[o0;1]; o1 = [v1(1); v1(2); v1(3)];
v2 = T2*[o1;1]; o2 = [v2(1); v2(2); v2(3)];
v3 = T3*[o2;1]; o3 = [v3(1); v3(2); v3(3)];
v4 = T4*[o3;1]; o4 = [v4(1); v4(2); v4(3)];
v5 = T5*[o4;1]; o5 = [v5(1); v5(2); v5(3)];
v6 = T6*[o5;1]; o6 = [v6(1); v6(2); v6(3)];

<<<<<<< HEAD
T= T1*T2*T3*T4*T5*T6;

x = [o0(1) o1(1) o2(1) o3(1) o4(1) o5(1) o6(1)];
y = [o0(2) o1(2) o2(2) o3(2) o4(2) o5(2) o6(2)];
z = [o0(3) o1(3) o2(3) o3(3) o4(3) o5(3) o6(3)];

figure
    hold on; view(3);
    plot3(x,y,z);
    xlabel('$x$-coordinate', 'interpreter', 'latex');
    ylabel('$y$-coordinate', 'interpreter', 'latex');
    zlabel('$z$-coordinate', 'interpreter', 'latex');
    
=======
T= T1*T2*T3*T4*T5*T6
>>>>>>> 8f88e1649e88ea4f198fa109130a23baae9acb95

%% 5e
