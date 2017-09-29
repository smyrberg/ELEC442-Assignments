close all
clear all
clc

Q1= [1/sqrt(2) 1/sqrt(2) 0;
    -1/sqrt(2) 1/sqrt(2) 0;
    0 0 1];
Q2 = [1 0 0;
    0 -1/2 -sqrt(3)/2;
    0 sqrt(3)/2 -1/2];
d = [-5/sqrt(2); 5/sqrt(2); 4];

T1 = [Q1*Q2 d;
    zeros(1,3) 1];

[T,C] = DH_homog(-pi/4, 4, -5, 2*pi/3);