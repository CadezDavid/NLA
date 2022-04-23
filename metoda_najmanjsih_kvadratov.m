function x = metoda_najmanjsih_kvadratov(A, b)

[Q, R] = qr(A);

x = R \ (Q' * b);

end