function[e] = relative_error(A, y)
    e = norm(A \ y) / norm(y);
end
