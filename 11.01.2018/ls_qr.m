% Find the least squares approximation using the QR decomposition
function[x] = ls_qr(A, b)
    [Q R] = qr(A);
    n = size(A, 2);
    c = Q' * b;
    x = R(1:n, 1:n) \ c(1:n);
end

%!test
%! source 11.01.2018/ls_qr.m;
%!
%! A = [3; 4];
%! b = [3; 8];
%!
%! assert(ls_qr(A, b), 41/25, 1e-3);
