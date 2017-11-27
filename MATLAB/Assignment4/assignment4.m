close all
clear variables

%% Variables
l1 = 1;
l2 = 1;
m1 = 1;
m2 = 1;
g = 9.81;
tau_1 = 0;
tau_2 = 0;
Kp = diag([1 1]);
Kv = diag([2 2]);
x_init = [-pi/2;0;0;0];
q_d = [0; pi/2];
sim('assgt4');


%% Plot
figure
hold on;
subplot(4,1,1); plot(theta_1); ylabel('$\theta_1$', 'interpreter', 'latex');
subplot(4,1,2); plot(theta_2); ylabel('$\theta_2$', 'interpreter', 'latex');
subplot(4,1,3); plot(theta_dot_1); ylabel('$\dot{\theta}_1$', 'interpreter', 'latex');
subplot(4,1,4); plot(theta_dot_2); ylabel('$\dot{\theta}_2$', 'interpreter', 'latex');

figure
hold on;
plot(energy); plot(T, 'black'); plot(V, 'r');