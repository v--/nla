function[e V iter_count] = jacobi_eigenvalues(A, sigma_initial, tolerance, max_iterations)
    n = length(A);

    sigma = sigma_initial;
    iter_count = 0;
    V = eye(n);

    while and(sigma > tolerance, iter_count < max_iterations)
        B = A - diag(diag(A));
        [_, max_index] = max(abs(B(:)));
        [i, j] = ind2sub(size(A), max_index);

        if abs(A(i, i) - A(j, j)) < 10e-14
            phi = pi/4;
        else
            s = 2 * A(i, j) / (A(i, i) - A(j, j));
            phi = 0.5 * atan(s);
        end

        U = eye(n);
        U(i, i) = cos(phi);
        U(i, j) = -sin(phi);
        U(j, i) = sin(phi);
        U(j, j) = cos(phi);

        A = U' * A * U;
        V *= U;

        sigma = sum(B.^2);
        iter_count++;
   end

   e = diag(A);
end

%!test
%! source 18.01.2018/jacobi_eigenvalues.m;
%!
%! A = [2 -1 0; -1 2 -1; 0 -1 2];
%!
%! [e V iterations] = jacobi_eigenvalues(A, 1000, 1e-14, 1000);
%! assert(sort(e), sort(eig(A)), 1e-3); % Verify that e contains the eigenvalues of A
%! assert(A * V, V * diag(e), 1e-3); % Verify that V contains the eigenvectors of A
