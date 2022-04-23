function [p_max,q_max] = maxindex(A)

n = size(A,1);

p_max = 1;
q_max = 2;

for p = 1:n
    for q = p+1:n
        if abs(A(p,q)) > abs(A(p_max,q_max))
            p_max = p;
            q_max = q;
        end
    end
end

end