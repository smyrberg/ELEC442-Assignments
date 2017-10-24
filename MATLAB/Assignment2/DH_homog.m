function [T, C] = DH_homog(theta, d, a, alpha)
    i=[1;0;0];
    k=[0;0;1];
    angle = [expm(theta*skew(k)) zeros(3,1); zeros(1,3) 1];
    offset = [eye(3) d*k; zeros(1,3) 1];
    length = [eye(3) a*i; zeros(1,3) 1];
    twist = [expm(alpha*skew(i)) zeros(3,1); zeros(1,3) 1];
    C = expm(theta*skew(k)) * expm(alpha*skew(i));
    T = angle*offset*length*twist;
end