function[x] = gauss_with_pivoting(A, b)
    [L U p] = gauss_with_pivoting_decompose(A);
    x = gauss_with_pivoting_solve(L, U, p, b);
end

%!test
%! A = [1 4 7; 2 5 8; 3 6 10];
%! b = [1; 1; 1];
%! x = gauss_with_pivoting(A, b);
%!
%! assert(x, A \ b, 1e-3);
