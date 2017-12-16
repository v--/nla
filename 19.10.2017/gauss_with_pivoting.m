function[L U p] = gauss_with_pivoting_decompose(A)
    n = length(A);
    L = eye(n);
    U = A;
    p = 1:n - 1;

    % Forward algorithm
    for k = 1:n - 1
        [~, m_] = max(abs(A(k:n, k)));
        m = k - 1 + m_;

        if m != k
            p(k) = m;
            U([k m], :) = U([m k], :);
        end

        range = k + 1:n;
        L(range, k) = U(range, k) / U(k, k);
        U(range, k) = 0;
        U(range, range) = U(range, range) - L(range, k) * U(k, range);
    end
end

function[x] = gauss_with_pivoting_solve(L, U, p, b)
    n = length(L);

    for k = 1:n - 1
        if p(k) != k
            b([k p(k)], :) = b([p(k) k], :);
        end

        range = k + 1:n;
        b(range) = b(range) - L(range, k) * b(k);
    end

    x = zeros(n, 1);

    for k = n - 1:-1:1
        x(k) = 1 / U(k, k) * (b(k) - U(k, k + 1:n) * x(k + 1:n));
    end
end

function[x] = gauss_with_pivoting(A, b)
    [L U p] = gauss_with_pivoting_decompose(A);
    x = gauss_with_pivoting_solve(L, U, p, b);
end

%!test
%! source 19.10.2017/gauss_with_pivoting.m;
%!
%! A = [1 4 7; 2 5 8; 3 6 10];
%! b = [1; 1; 1];
%! x = gauss_with_pivoting(A, b);
%!
%! assert(x, A \ b, 1e-3);
