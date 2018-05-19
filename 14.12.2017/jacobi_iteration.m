function [x iter_count] = jacobi_iteration(A, b, x_initial, tolerance, max_iterations)
    n = length(b);
    x_old = x_initial;
    x_new = zeros(n, 1);
    err = 1.0;
    iter_count = 0;

    while and(err > tolerance, iter_count < max_iterations)
        for i = 1:n
            x_new(i) = (b(i) - A(i, 1:i - 1) * x_old(1:i - 1) - A(i, i + 1:n) * x_old(i + 1:n)) / A(i, i);
        end

        err = norm(x_new - x_old) / norm(x_new);
        iter_count++;
        x_old = x_new;
    end

    x = x_new;
end

%!test
%! A = [2 -1 0; -1 2 -1; 0 -1 2];
%! b = [1; 0; 1];
%!
%! [x iterations] = jacobi_iteration(A, b, [0; 0; 0], 1e-3, 1000);
%! assert(x, A \ b, 2e-3);
%! assert(iterations, 19);
