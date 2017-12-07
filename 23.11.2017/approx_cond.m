function[condition, approx] = approx_cond(n)
    % A is a symmetric tridiagonal matrix
    A = diag(2 * ones(n, 1)) + diag(-ones(n - 1, 1), 1) + diag(-ones(n - 1, 1), -1);

    condition = cond(A, 2);
    approx = (4 / pi^2) * (n + 1)^2;
end

%!test
%! source support/assert_fundamental.m
%! source 23.11.2017/approx_cond.m
%!
%! [conds, approx] = arrayfun(@approx_cond, 10:10:200);
%!
%! % Verify that the ratio converges to 1
%! assert_fundamental(conds ./ approx - 1);
