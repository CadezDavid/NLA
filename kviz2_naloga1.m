A = [15.7577    0.7060    0.8235    0.4387    0.4898; 0.7431   20.0318    0.69480    0.3816    0.4456;     0.3922    0.2769   25.3171    0.7655    0.6463;     0.68550    0.0462    0.9502   30.7952    0.79940;     0.1712    0.0971    0.0344    0.1869   35.7547];

[U, R] = schur(A);
sum = 0;
n = size(R, 1);
for i=1:n-1
    sum = sum + R(i,i+1);
end
disp(sum)

[Q, R2] = zamenjaj(R,1,3);
disp(norm(R - R2));

U2 = U * Q;
disp(norm(U2, 1));

R4 = R;
for i = 1:floor(n/2)
    [~, R4] = zamenjaj(R4, i, n-i+1);
end

sum = 0;
for i=1:n-1
    sum = sum + R4(i,i+1);
end
disp(sum)