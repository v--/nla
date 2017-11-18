function[L] = cholesky(A)
    n = size(A, 1);
    L = zeros(n, n);

    for k = 1:n
        L(k, k) = sqrt(A(k, k) - L(k, 1:k - 1) * L(k, 1:k - 1)');

        for i = k + 1:n
            L(i, k) = (A(k, i) - L(k, 1:k - 1) * L(i, 1:k - 1)') / L(k, k);
        end
    end
end

%!test
%! source 09.11.2017/cholesky.m;
%!
%! M = rand(3);
%! A = M' * M;
%! L = cholesky(A);
%!
%! assert(L * L', A, 1e-3);
