function x = off(A)

n = size(A, 1);
x = 0;

for i = 1:n
    for j = 1:n
        if i ~= j
            x = x + A(i,j)^2;
        end
    end
end

x = sqrt(x);

end