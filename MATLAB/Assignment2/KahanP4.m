function theta = KahanP4(a,b,c)
    if a+b>=c && c>=abs(a-b)
        theta = 2*atan(((a+b)^2 -c^2)/(c^2 - (a-b)^2));
    else
        theta = 'No solution';
    end
end