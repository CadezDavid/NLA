n = 301;
h = 15;
gamma = 8;

d = zeros(2*h+1,1);
for k = 1:2*h+1
    d(k) = exp(-(k-h-1)^2/(2*gamma^2));
end
d = d ./ sum(d);

A = toeplitz([d(h+1:end); zeros(n-h-1,1)]);

[U, S, V] = svd(A);


r = 1;
Ar = U(:,1:r) * S(1:r,1:r) * V(:,1:r)';
while norm(A - Ar) > 1e-2
    r  = r + 1;
    Ar = U(:,1:r) * S(1:r,1:r) * V(:,1:r)';
end

disp(norm(A-Ar));


x = [zeros(49, 1); linspace(0,1,101)'; zeros(n-150,1)];
hold on
plot(x);
plot(A*x);
hold off

disp(norm(x-A*x,"inf"))



rng(1000); w = 0.01 * randn(n, 1);
y = A*x + w;


r = 20;
invAr = V(:,1:r) * diag(1./diag(S(1:r,1:r))) * U(:,1:r)';
disp(norm(x - invAr*y, "inf"));

a = 0.15;
s = diag(S);
s1 = s ./ (s.^2 + a^2);

S1 = diag(s1);
inv_A = V * S1 * U';
rek_x = inv_A * x;
disp(max(rek_x));