function [A, Q] = jacobi(A, steps, eps, eps1)

n = size(A, 1);
Q = eye(n);

for step = 1:steps

    [p, q] = maxindex(A);
    if abs(A(p,q)) < eps1
        return
    end

    [c, s] = jacobi_cs(A, p, q);
    R = [c -s; s c];
    
    A(:,[p q]) = A(:,[p q]) * R;
    A([p q],:) = R' * A([p q],:);
    Q(:,[p q]) = Q(:,[p q]) * R;

    if off(A) < eps
        return
    end
end

end