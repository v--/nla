function[x] = cholesky_solve(A, b)
    L = cholesky(A);
    y = L \ b;
    x = L' \ y;
end

%!test
%! M = rand(3);
%! A = M' * M;
%! b = sum(A, 2);
%! x = cholesky_solve(A, b);
%!
%! assert(x, A \ b, 1e-3);
