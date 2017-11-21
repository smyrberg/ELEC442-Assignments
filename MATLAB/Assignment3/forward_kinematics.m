function [k_vectors, origins, J, Q_end] = forward_kinematics(theta, d, a, alpha)
    k_0 = [0;0;1];o_0=[0;0;0]; J = [];
    T = zeros(4,4,6); Q = zeros(3,3,6); k_vectors = zeros(3,1,6); 
    origins = zeros(3,1,6);
    T_end = eye(4); Q_end=eye(3);
    for i = 1:6
        [T_temp, Q_temp] = DH_homog(theta(i), d(i), a(i), alpha(i));
        T_end = T_end*T_temp; Q_end = Q_end*Q_temp;
        T(:,:,i) = T_temp; Q(:,:,i) = Q_temp;
        k_vectors(:,:,i) = Q_end(1:3,3);
        origins(:,:,i) = T_end(1:3,4);
    end
    %Generate Jacobian for puma 560    
    for i = 1:6
        if i==1
            J = [J, [cross(k_0, origins(:,:,6)-o_0); k_0]];
        else
            J = [J, [cross(k_vectors(:,:,i-1), origins(:,:,6)-origins(:,:,i-1)); k_vectors(:,:,i-1)]];
        end
    end
end