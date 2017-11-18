source 09.11.2017/cholesky.m;

function[x] = cholesky_solve(A, b)
    L = cholesky(A);
    y = L \ b;
    x = L' \ y;
end

%!test
%! source 09.11.2017/cholesky_solve.m;
%!
%! M = rand(3);
%! A = M' * M;
%! b = sum(A, 2);
%! x = cholesky_solve(A, b);
%!
%! assert(x, A \ b, 1e-3);
