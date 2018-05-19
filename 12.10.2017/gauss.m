function[x] = gauss(A, b)
    n = length(A);
    L = eye(n);
    U = A; % This assignment is really pointless, but it's here for the sake of having L and U.

    for k = 1:n - 1
        range = k + 1:n;
        L(range, k) = U(range, k) / U(k, k);
        U(range, k) = 0;
        U(range, range) = U(range, range) - L(range, k) * U(k, range);
        b(range) = b(range) - L(range, k) * b(k);
    end

    x = zeros(n, 1);

    for k = n - 1:-1:1
        x(k) = 1 / U(k, k) * (b(k) - U(k, k + 1:n) * x(k + 1:n));
    end
end

%!test
%! A = [1 4 7; 2 5 8; 3 6 10];
%! b = [1; 1; 1];
%! x = gauss(A, b);
%!
%! assert(x, A \ b, 1e-3);
