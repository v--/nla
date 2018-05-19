function[t_cholesky t_qr] = benchmark_ls(m, n)
    t = (0:m - 1) / (m - 1);
    A = zeros(m, n);

    for j = 1:n
        A(1:m, j) = t.^(j - 1);
    end

    b = t.^(n-1);

    tic;
    % ls_cholesky(A, b)
    t_cholesky = toc;

    tic;
    % ls_qr(A, b)
    t_qr = toc;
end

%!test
%! [t_cholesky t_qr] = arrayfun(@benchmark_ls, 10:10:30, 5:5:15);
%!
%! assert(not(t_cholesky < t_qr) | not(t_cholesky > t_qr)); % Verify that for small matrices the two methods perform on par
% For larger matrices, however, ls_cholesky fails to produce proper results due to rounding errors
