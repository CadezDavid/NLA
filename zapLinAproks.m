function [lambda, v] = zapLinAproks(T, dT, lambda, maxKorakov, eps)

for k = 1:maxKorakov
    [U, V] = eig(T(lambda), dT(lambda));
    es = diag(V);
    [~, i] = min(abs(es));
    v = U(:,i);
    dlambda = es(i);
    
    if abs(dlambda) < eps
        break
    end

    lambda = lambda - dlambda;
end