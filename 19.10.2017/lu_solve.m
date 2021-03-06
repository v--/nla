function[x] = lu_solve(A, b)
    n = length(A);
    [L U] = lu_decompose(A);

    for k = 1:n - 1
        b(k + 1: n) = b(k + 1: n) - L(k + 1: n, k) * b(k);
    end

    x = zeros(n, 1);

    for k = n - 1:-1:1
        x(k) = 1 / U(k, k) * (b(k) - U(k, k + 1:n) * x(k + 1:n));
    end
end

%!test
%! A = [1 4 7; 2 5 8; 3 6 10];
%! b = [1; 1; 1];
%! x = lu_solve(A, b);
%!
%! assert(x, A \ b, 1e-3);
