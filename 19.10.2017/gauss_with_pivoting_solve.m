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
