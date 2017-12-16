% a, b and c are the diagonals of the matrix, e.g.
%
%     / b(1) a(1) 0    \
% A = | c(1) b(2) a(2) |
%     \ 0    c(2) b(3) /
%
% and f is the right-hand side of the equation Ax = f
function[x] = gauss_tridiagonal(a, b, c, f)
    n = length(b);

    for k = 1:n - 1
        l(k) = a(k) / b(k);
        b(k + 1) = b(k + 1) - l(k) * c(k);
        f(k + 1) = f(k + 1) - l(k) * f(k);
    end

    x = zeros(n, 1);
    x(n) = f(n) / b(n);

    for k = n - 1:-1:1
        x(k) = 1 / b(k) * (f(k) - c(k) * x(k + 1));
    end
end

%!test
%! source 16.11.2017/gauss_tridiagonal.m;
%!
%! a = [-1 -1];
%! b = [2 2 2];
%! c = [-1 -1];
%! f = [1; 0; 1];
%! A = diag(b) + diag(a, 1) + diag(c, -1);
%! x = gauss_tridiagonal(a, b, c, f);
%!
%! assert(x, A \ f, 1e-3);
