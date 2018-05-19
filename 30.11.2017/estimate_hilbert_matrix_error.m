% This is an example of the magnitude of errors in matrices with high condition numbers.

function[actual, estimate] = estimate_hilbert_matrix_error(n)
    A = hilb(n);
    x = ones(n, 1);
    b = A * x;

    x_approx = A \ b;
    b_approx = A * x_approx;

    actual = 0;
    estimate = 0;

    x_relative_error = norm(x - x_approx, inf) / norm(x, inf);
    b_relative_error = norm(b - b_approx, inf) / norm(b, inf);

    actual = x_relative_error;
    estimate = cond(A, inf) * b_relative_error;
end

%!test
%! % Elements get too small for larger matrices and they become hard to invert.
%! [actual, estimate] = arrayfun(@estimate_hilbert_matrix_error, 3:11);
%! assert(actual <= estimate); % This is a theoretic inequality
%! assert(actual ./ estimate, zeros(1, 9), 0.3); % This shows how estimates differ from actual errors
