n = 200;
h = 20;
gamma = 5;

d = zeros(2*h+1,1);
for k = 1:2*h+1
    d(k) = exp(-(k-h-1)^2/(2*gamma^2));
end
d = d ./ sum(d);

disp(mean(d));
%plot(d);
%plot(d(h+1:end));

A = toeplitz([d(h+1:end); zeros(n-h-1,1)]);

if mod(n, 2) == 0
    disp(sum(diag(A)) + sum(diag(flip(A))));
else
    disp(sum(diag(A)) + sum(diag(flip(A))) - A((n+1)/2,(n+1)/2));
end

x = [zeros(49,1); ones(51,1); zeros(100,1)];
y = A*x;
hold on
plot(x);
plot(y);
hold off

disp(norm(x - y));


x4 = [zeros(49,1); linspace(0,1,51)'; 4*ones(50,1); zeros(50,1)];
rng(1000); w = 0.1*randn(n,1);
y4 = A*x4 + w;



r = 10;
[U, S, V] = svd(A);
x_reg = V(:,1:r) * inv(S(1:r,1:r)) * U(:,1:r)' * y4;

hold on
plot(x4);
plot(y4);
plot(x_reg,'LineWidth',2);
hold off

disp(norm(x4 - x_reg));