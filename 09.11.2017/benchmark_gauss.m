source 12.10.2017/gauss.m;
source 19.10.2017/gauss_with_pivoting.m;

% Benchmark the basic Gaussian algorithm with and without pivoting
function[t1 t2] = benchmark_gauss(sizes)
    for n = sizes
        A = rand(n, n);
        b = rand(n, 1);

        tic;
        gauss(A, b);
        t1(n) = toc;

        tic;
        gauss_with_pivoting(A, b);
        t2(n) = toc;
    end
end

%!test
%! source 09.11.2017/benchmark_gauss.m
%!
%! [t1 t2] = benchmark_gauss(20:20:100);
%!
%! assert(~(t1 > t2 || t1 < t2)); % Verify that the two implementations run on par
