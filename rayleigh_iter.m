function z = rayleigh_iter(A, z, steps, eps)
n = size(A, 1);
[H, U] = hessenberg(A);

for step = 1:steps
    r = (z'*H*z) / (z'*z);
    if norm(H*z-r*z) < eps
        break;
    end
    y = lin_sistem_za_zg_hess(H-r*eye(n), z);
    z = y / norm(y);
end

% x l. v. A   <-->  U*x l. v. H
z = U'*z;

end