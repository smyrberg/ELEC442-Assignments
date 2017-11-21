close all
clear variables
clc

%% Task 2

theta_init = deg2rad([0 0 90 0 90 0]);
theta_offset = deg2rad([0 0 90 0 0 0]);
d = [0 0 -149.09 433.07 0 60];
a = [0 431.80 20.32 0 0 0];
alpha = deg2rad([-90 180 90 90 -90 0]);

Fs = 50; dt = 1/Fs;

% Initial end effector pose
[k_vectors, origins, J_init, Q_end_init] = forward_kinematics(theta_init + theta_offset, d, a, alpha);
o_end_init = origins(:,:,6);
k_end_init = k_vectors(:,:,6);

% Get desired ende effector poition and pose
o_d = [317;506;673];
j_d = [-0.389; -0.325; 0.862];
k_d = [0.769; 0.401; 0.498];

% Or ask for input
% o_d_in = input('Input desired end effector origin');
% k_d_in = input('Input desired k_d'); k_d = k_d_in/norm(k_d_in);
% j_d_in = input('Input desired j_d');  j_d = j_d_in/norm(j_d_in);
% while k_d'*j_d ~= 0
%     disp('k_d and j_d not orthogonal, try again');
%     j_d_in = input('Input desired j_d');  j_d = j_d_in/norm(j_d_in);
% end
% i_d = cross(j_d, k_d)/norm(cross(j_d, k_d));

% Calculating omegas, theta_dots and Jacobians
o_n = o_end_init; %end effector position
q = theta_init;

for ts = 0:dt:1 
    q_prev = q;
    dq = (J\v_n)*dt; % equivalent to inv(J)*v_n but faster
    q = q_prev + dq;
    
    q = q_prev + q_dot_prev*dt + q_dotdot_prev*(dt)^2/2;
    
    o_n_prev = o_n;
    o_n = o_n_prev + o_n_dot;
    v_n = [o_n_dot ; omega_n];
end


