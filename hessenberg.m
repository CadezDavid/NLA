function [H, U] = hessenberg(A)

% vrne H in U, da je H zgornje Hess., U ortogonalna in velja H = U*A*U'

n = size(A, 1);

U = eye(n);

for i = 1:n-1
    w = A(i+1:end,i);
    if w(1) > 0
        w(1) = w(1) + norm(w);
    else
        w(1) = w(1) - norm(w);
    end
    A(i+1:end,:) = A(i+1:end,:) - (2/(w'*w))*(w*w')*A(i+1:end,:);
    A(:,i+1:end) = A(:,i+1:end) - (2/(w'*w))*A(:,i+1:end)*(w*w');
    U(i+1:end,:) = U(i+1:end,:) - (2/(w'*w))*(w*w')*U(i+1:end,:);
end

H = A;