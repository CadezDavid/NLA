function x = off(A)

x = norm(A - diag(diag(A)));

end