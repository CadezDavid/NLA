function x = lin_sistem_za_zg_hess(A, b)

% vzame zg. hess. matriko A in vektor v, ter vrne x, da velja A*x=b

n = size(A,1);
x = zeros(n,1);

for i = 1:n-1
    r = sqrt(A(i,i)^2+A(i+1,i)^2); c = A(i,i) / r; s = A(i+1,i) / r;
    R = [c s; -s c];
    A([i i+1],:) =  R * A([i i+1],:);
    b(i:i+1) = R * b(i:i+1);
end

x(n) = b(n) / A(n,n);
for j = n-1:-1:1
    x(j) = (b(j) - A(j,j+1:end)*x(j+1:end)) / A(j,j);
end

end