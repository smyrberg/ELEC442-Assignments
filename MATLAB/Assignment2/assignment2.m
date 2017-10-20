close all
clear all
clc

%% Coordinate systems
i0 = [1;0;0];
j0 = [0;1;0];
k0 = [0;0;1];
o0 = [0;0;0];

kd = [0.769; 0.401; 0.498];
od = [317; 506; 673];

k6 = kd;

o4_home = [431.8+433.07;149.09;20.32];
o4 = od - 60*k6;

%% Finding theta1
theta1_home = KahanP2(k0, i0, o4_home-o0);
theta1 = KahanP2(k0, i0, o4-o0);