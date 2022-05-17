function [lambda, v] = zapLinAproks(T, dT, lambda, maxKorakov, eps)

for k = 1:maxKorakov
    [U, V] = eig(T(lambda), dT(lambda));
    eig = diag(V);
    [~, i] = min(abs(eig));
    v = U(i);
    dlambda = eig(i);
    
    if abs(dlambda) < eps
        break
    end

    lambda = lambda - dlambda;
end