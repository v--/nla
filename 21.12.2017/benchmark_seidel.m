source 14.12.2017/jacobi_iteration.m;
source 14.12.2017/seidel_iteration.m;

function[iter_jacobi iter_seidel] = benchmark_seidel(n, diagonal)
    A = diag(diagonal * ones(n, 1)) + diag(-ones(n - 1, 1), 1) + diag(-ones(n - 1, 1), -1);
    b = [1; zeros(n - 2, 1); 1];
    x_initial = zeros(n, 1);

    tolerance=1e-15;
    max_iterations=1e20;

    [x iter_jacobi] = jacobi_iteration(A, b, x_initial, tolerance, max_iterations);
    [x iter_seidel] = seidel_iteration(A, b, x_initial, tolerance, max_iterations);
end

%!test
%! source 21.12.2017/benchmark_seidel.m;
%!
%! # First, verify that Seidel's algorithm is more efficient than Jacobi's
%! [iter_jacobi iter_seidel] = arrayfun(@(n) benchmark_seidel(n, 2), 2:6);
%! assert(iter_seidel < iter_jacobi);
%!
%! # Verify that both methods have a slowly growing iteration count for diagonally dominant matrices
%! [iter_jacobi iter_seidel] = arrayfun(@(n) benchmark_seidel(n, 10), 20:10:40);
%! assert(min(iter_jacobi), max(iter_jacobi));
%! assert(min(iter_seidel), max(iter_seidel));
