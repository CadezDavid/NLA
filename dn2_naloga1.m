 A = magic(6); [U,R] = schur(A);


[Q, R2] = zamenjaj(R, 3, 4);
disp(norm(R-R2));
disp(norm(Q, "fro"));

[Q, R2] = zamenjaj(R, 1, 6);
disp(norm(R-R2));