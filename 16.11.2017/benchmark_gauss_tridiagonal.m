% Benchmark the Cholesky decomposition-based algorithm for solving systems of linear equations with
% the tridiagonal Gaussian algorithm.
function[t_cholesky t_tridiagonal] = benchmark_gauss_tridiagonal(n)
    a = -ones(n-1, 1);
    b = 2 * ones(n, 1);
    c = a;
    f = [1 zeros(1, n - 2) 1]';
    A = diag(b) + diag(a, 1) + diag(c, -1);

    tic;
    cholesky_solve(A, f);
    t_cholesky = toc;

    tic;
    gauss_tridiagonal(a, b, c, f);
    t_tridiagonal = toc;
end

%!test
%! [t_cholesky t_tridiagonal] = arrayfun(@benchmark_gauss_tridiagonal, 20:20:100);
%!
%! assert(t_tridiagonal < t_cholesky); % Verify that the tridiagonal algorithm always runs faster
