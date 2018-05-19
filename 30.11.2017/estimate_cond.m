function[condition] = estimate_cond(A)
    n = length(A);
    relative_errors = arrayfun(@() relative_error(A, rand(n, 1)), 1:5);
    condition = norm(A) * max(relative_errors);
end

%!test
%! A = [1 -2; -3 4];
%! assert(estimate_cond(A) / cond(A), 1, 0.3);
