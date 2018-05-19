function[condition, approx] = approx_hilbert_matrix_cond(n)
    condition = cond(hilb(n));
    approx = exp(3.44 * n - 4.05);
end

%!test
%! # This only works for small Hibert matrices
%! [conds, approx] = arrayfun(@approx_hilbert_matrix_cond, 2:10);
%!
%! assert(log(conds), log(approx), 0.2);
