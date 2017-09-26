close all 
clear all
clc

angle1 = 'Type the first joint angle in degrees: ';
angle2 = 'And now the second: ';
angle3 = 'Third: ';
angle4 = 'Fourth: ';
angle5 = 'Fifth: ';
angle6 = 'Sixth: ';

theta1 = degtorad(input(angle1));
theta2 = degtorad(input(angle2));
theta3 = degtorad(input(angle3));
theta4 = degtorad(input(angle4));
theta5 = degtorad(input(angle5));
theta6 = degtorad(input(angle6));

T1 = DH_homog(theta1, 0, 0, -pi/2);
T2 = DH_homog(theta2, 0, 431.8, pi);
T3 = DH_homog(theta3 + pi/2, -149.09, 20.32, pi/2);
T4 = DH_homog(theta4, 433.07, 0, pi/2);
T5 = DH_homog(theta5, 0, 0, -pi/2);
T6 = DH_homog(theta6, 60, 0, 0);

T= T1*T2*T3*T4*T5*T6;
