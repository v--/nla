function[L U] = lu_decompose(A)
    n = length(A);
    L = eye(n);
    U = A;

    for k = 1:n
        range = k + 1:n;
        L(range, k) = U(range, k) / U(k, k);
        U(range, k) = 0;
        U(range, range) = U(range, range) - L(range, k) * U(k, range);
    end
end

%!test
%! A = [1 4 7; 2 5 8; 3 6 10];
%! [L U] = lu_decompose(A);
%!
%! assert(L * U, A);
