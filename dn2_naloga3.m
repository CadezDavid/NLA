f1 = @(x,y) 1.4 .* cos(x).^2 + 1.4 .* sin(y).^2 + x.*y + sin(x.*y/5);
f2 = @(x,y,z) 1.4 .* cos(x).^2 + 1.4 .* sin(y).^2 + x.*y + sin(x.*y/5) + 0.1*z.^2;

tocke = linspace(-5,5,100);

M1 = f1(tocke', tocke);
M2 = (1:100)' * (1:100);
for i = 1:100
    M2(:,:,i) = f2(tocke', tocke, tocke(i));
end

[U, S, V] = svd(M1);
m = 1;
diff = max(max(abs(U(:,1:m)*S(1:m,1:m)*V(:,1:m)' - M1)));
while diff > 1e-3
    m = m + 1;
    diff = max(max(abs(U(:,1:m)*S(1:m,1:m)*V(:,1:m)' - M1)));
end
disp(diff);

% M1 = U(:,1:m)*S(1:m,1:m)*V(:,1:m)';

T2 = tensor(M2);
P = ttm(T2, M1, 2);
Pr = tenmat(P,3);
disp(norm(Pr(:,5000)));