% Benchmark the basic Gaussian algorithm with and without pivoting
function[t_gauss t_pivoting] = benchmark_gauss(n)
    A = rand(n, n);
    b = rand(n, 1);

    tic;
    gauss(A, b);
    t_gauss = toc;

    tic;
    gauss_with_pivoting(A, b);
    t_pivoting = toc;
end

%!test
%! [t_gauss t_pivoting] = arrayfun(@benchmark_gauss, 20:20:100);
%!
%! assert(t_gauss <= t_pivoting); % Verify that the Gaussian algorithm without pivoting is at least as fast
