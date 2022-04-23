function [c, s] = jacobi_cs(A, p, q)

if A(p,q) == 0
    c = 1;
    s = 0;
    return
end

tau = (A(p,p) - A(q,q)) / (2 * A(p,q));
t = sign(tau) / (abs(tau) + sqrt(1 + tau^2));
c = 1 / sqrt(1 + t^2);
s = c * t;

end