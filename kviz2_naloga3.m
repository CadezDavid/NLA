f1 = @(x,y)  1.70000*sin(5*sqrt(x.^2 + y.^2)) + 1.00000*sin(5*sqrt(18 + 6*x + x.^2 + 6*y + y.^2));
f2 = @(x,y,z) 1.70000*cos(x).^2 + 1.00000*sin(y).^2 + x.*y + sin(x.*y/5) + 0.10 * z.^2;

tocke = linspace(-5,5,100);
tocke2 = linspace(-5,5,50);

M1 = f1(tocke', tocke);
M2 = (1:50)' * (1:50);
for i = 1:50
    M2(:,:,i) = f2(tocke2', tocke2, tocke2(i));
end

[U, S, V] = svd(M1);
A = U * (S .* (S > 1e-3)) * V';
disp(norm(A - M1));

T2 = tensor(M2);
M2streha = tenmat(T2, 1);
[U2, S2, V2] = svd(M2streha(:,:));
A2 = U2(:,1:5) * S2(1:5,1:5) * V2(:,1:5)';
Tm = reshape(A2, [50 50 50]);

B1 = tenmat(M2,1);
B2 = tenmat(Tm,1);

disp(norm(B1(:,:) - B2(:,:),"fro"))