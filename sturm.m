function eigs = sturm(A, a, b, eps)

n = size(A, 1);

p = zeros(n+1,n+1);
p(1,n+1) = 1;
for i = 1:n
    p(i+1,:) = [zeros(1,n-i), (-1)^i * charpoly(A(1:i,1:i))];
end

eigs = [];
t2 = b; t1 = a;
remain = true;

while remain == true
    while t2 - t1 > eps
        half = (t1 + t2) / 2;
        
        seq_1 = sturm_seq(p, t1);
        seq_half = sturm_seq(p, half);
        seq_2 = sturm_seq(p, t2);

        signs_1 = seq_1(1:end-1) .* seq_1(2:end);
        signs_half = seq_half(1:end-1) .* seq_half(2:end);
        signs_2 = seq_2(1:end-1) .* seq_2(2:end);

        first = sum(signs_1 >= 0) - sum(signs_half >= 0);
        second = sum(signs_half >= 0) - sum(signs_2 >= 0);
        if first > 0
            t2 = half;
        elseif second > 0
            t1 = half;
        else
            remain = false;
            break;
        end
    end
    
    if remain == true
        for j = 1:(first + second)
            eigs = [eigs, t1];
        end
        t1 = t2; t2 = b;
    end
end

end