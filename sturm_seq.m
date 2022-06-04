function seq = sturm_seq(p, a)

n = size(p, 1);

seq = zeros(n,1);
for i = 1:n
    seq(i) = polyval(p(i,:), a);
end

end