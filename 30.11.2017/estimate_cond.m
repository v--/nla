function[e] = relative_error(A, y)
    e = norm(A \ y) / norm(y);
end

function[condition] = estimate_cond(A)
    n = size(A, 2);
    relative_errors = arrayfun(@() relative_error(A, rand(n, 1)), 1:5);
    condition = norm(A) * max(relative_errors);
end

%!test
%! source 30.11.2017/estimate_cond.m;
%!
%! A = [1 -2; -3 4];
%! assert(estimate_cond(A) / cond(A), 1, 0.3);
