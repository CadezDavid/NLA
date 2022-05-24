% primeri

A = round(10 * rand(3, 4, 2))

At = tensor(A)

% vektorizacija
At(:);

%  matrifikacija
tenmat(At, 1)
tenmat(At, 2)
tenmat(At, 3)


% množenje z matriko X x_j A
B = round(10 * rand(4, 4));
C = ttm(At, B, 2)

% ali velja enakost?
tenmat(C, 2) - B * tenmat(At, 2)