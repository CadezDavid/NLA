f1 = @(x,y,z) 1.6e-3 * x.^2 + 1.6e-3 * y.^2 - 1;
f2 = @(x,y,z) 5.3e-4*x.^2 + 5.3e-4*y.^2 + 5.3e-4*z.^2 + 2.7e-2*x -1;
f3 = @(x,y,z) 1.4e-4*x + 1.0e-4*y + z - 3.4e-3;

f = @(x, y, z) [f1(x, y, z); f2(x, y, z); f3(x, y, z)];
disp(norm(f(25, -3, 0)));

i0 = [1 4 2 5 7 3 6 8 4 7 5 6 9 7 8 9 1 4 8 10 2 5 9 10 3 6 10]; j0 = [1 1 2 2 2 3 3 3 4 4 5 6 6 7 7 7 8 8 8 8 9 9 9 9 10 10 10]; a0 = [1.6e-3 5.3e-4 1.6e-3 5.3e-4 1.0e-4 1.6e-3 5.3e-4 1.0e-4 5.3e-4 1 5.3e-4 5.3e-4 1 -3.4e-3 1 1.0e-4 -1 -1 -3.4e-3 1.0e-4 -1 -1 -3.4e-3 1 -1 -1 -3.4e-3]; A0 = full(sparse(i0,j0,a0));
i1 = [7 4 8 5 9  6 10]; j1 = [7 8 8 9 9 10 10]; a1 = [-1.4e-4 0.027 -1.4e-4 0.027 -1.4e-4 0.027 -1.4e-4]; A1 = full(sparse(i1,j1,a1));
i2 = [1 4 2 5 3   6 10]; j2 = [8 8 9 9 10 10 10]; a2 = [1.6e-3 5.3e-4 1.6e-3 5.3e-4 1.6e-3 5.3e-4 0]; A2 = full(sparse(i2,j2,a2));

f = @(x,y,z) [f1(x,y,z); f2(x,y,z); f3(x,y,z)];

interval = [-80 80 -80 80 -80 80];
% fimplicit3(f1, interval);

[X, E] = polyeig(A0,A1,A2);

vec1 = X(:,13)./X(10,13);
vec2 = X(:,14)./X(10,14);

tocka1 = [E(13) vec1(8) vec1(9)];
tocka2 = [E(14) vec2(8) vec2(9)];
disp(tocka1);
disp(tocka2);


T = @(l) A0+A1*l+A2*l^2;
dT = @(l) A1+2*A2*l;

[lambda, v] = zapLinAproks(T,dT,25,10000,1e-16);
vec3 = v ./ v(end);
disp(vec3(9));