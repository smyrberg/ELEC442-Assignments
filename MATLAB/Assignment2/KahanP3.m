function [theta, phi] = KahanP3(s,t,u,v)
    s_hat = s/norm(s);
    t_hat = t/norm(t);
    u_hat = u/norm(u);
    v_hat = w/norm(v);
    
    A = [1 s_hat'*t_hat; t_hat'*s_hat 1];
    b = [u_hat'*s_hat v_hat'*t_hat];
    alphbet = b\A;
    alpha = alphbet(1);
    beta = alphbet(2);
    z = alpha*s_hat + beta*t_hat;
    
    if norm(z) > 1
        theta = 'No solutions exist';
        phi = 'No solutions exist';
    else
        w_hat = z + sqrt(1 - norm(z)^2)*(cross(s_hat,t_hat))/norm(cross((s_hat,t_hat));
        theta = KahanP2(s_hat,u_hat,w_hat);
        phi = KahanP2(t_hat,v_hat,w_hat);
    end
end