% Find the least squares approximation using Cholesky's decomposition
function[x] = ls_cholesky(A, b)
    L = chol(A' * A)';
    y = L \ (A' * b);
    x = L' \ y;
end

%!test
%! source 11.01.2018/ls_cholesky.m;
%!
%! A = [3; 4];
%! b = [3; 8];
%!
%! assert(ls_cholesky(A, b), 41/25, 1e-3);
