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
