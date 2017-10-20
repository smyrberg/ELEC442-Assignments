function theta = KahanP2(s,u,w)
    s_hat = s/norm(s);
    u_hat = u/norm(u);
    w_hat = w/norm(w);
    if s_hat'*cross(s_hat,u_hat) == s_hat'*cross(s_hat,w_hat)
        theta = 2*atan(norm(cross(s_hat,(u_hat-w_hat)))/norm(cross(s_hat,(u_hat+w_hat))));
        if w_hat'*cross(s_hat,(u_hat-w_hat)) < 0
            theta = -theta;
        end
    else
        theta = 'The solution does not exist';
    end
end