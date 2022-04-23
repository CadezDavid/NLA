function x = off(A)

n = size(A, 1);
x = 0;

for i = 1:n
    for j = i+1:n
        x = x + 2 * A(i, j)^2;
    end
end

x = sqrt(x);

end