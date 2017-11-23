source 09.11.2017/cholesky_solve.m;
source 16.11.2017/gauss_tridiagonal.m;

% Benchmark the Cholesky decomposition-based algorithm for solving systems of linear equations with
% the tridiagonal Gaussian algorithm.
function[t1 t2] = benchmark_gauss_tridiagonal(n)
    a = -ones(n-1, 1);
    b = 2 * ones(n, 1);
    c = a;
    f = [1 zeros(1, n - 2) 1]';
    A = diag(b) + diag(a, 1) + diag(c, -1);

    tic;
    cholesky_solve(A, f);
    t1 = toc;

    tic;
    gauss_tridiagonal(a, b, c, f);
    t2 = toc;
end

%!test
%! source support/benchmark.m;
%! source 16.11.2017/benchmark_gauss_tridiagonal.m
%!
%! [t1 t2] = benchmark_scalar(20:20:100, @benchmark_gauss_tridiagonal);
%!
%! assert(t2 < t1); % Verify that the tridiagonal algorithm always runs faster
