function x = metoda_totalnih_najmanjsih_kvadratov(A, b)

[~, ~, V] = svd([A b]);

x = - V(1:end-1,end) ./ V(end, end);

end