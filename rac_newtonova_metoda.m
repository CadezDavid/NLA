function x = rac_newtonova_metoda(u, d, ro, i, x0)

f1 = @(x) ro * (u(1:i).^2)' * (d(1:i) - x).^(-1);
f2 = @(x) ro * (u(i+1:end).^2)' * (d(i+1:end) - x).^(-1);
df1 = @(x) ro * (u(1:i).^2)' * (d(1:i) - x).^(-2);
df2 = @(x) ro * (u(i+1:end).^2)' * (d(i+1:end) - x).^(-2);

A1 = [1/(d(i) - x0), 1; 1/(d(i) - x0)^2, 0];
b1 = [f1(x0); df1(x0)];
c1 = A1 \ b1;

A2 = [1/(d(i+1) - x0), 1; 1/(d(i+1) - x0)^2, 0];
b2 = [f2(x0); df2(x0)];
c2 = A2 \ b2;

c = [c1(1), c2(1), c1(2) + c2(2) + 1];
C1 = c(3);
C2 = -c(1) - c(2) - c(3) * d(i) - c(3) * d(i+1);
C3 = c(1) * d(i+1) + c(2) * d(i) + c(3) * d(i) * d(i+1);

x = (-C2 - sqrt(C2^2 - 4 * C1 * C3)) / (2 * C1);

end