function[growth] = high_growth_factor(n)
    % A is a matrix of the form
    %   1   0   0   0   1
    %  -1   1   0   0   1
    %  -1  -1   1   0   1
    %  -1  -1  -1   1   1
    %  -1  -1  -1  -1   1
    A = eye(n) + tril(-ones(n), -1) + [zeros(n - 1) ones(n - 1, 1); zeros(1, n)];
    growth = growth_factor(A);
end

%!test
%! % Verify that the growth factor of these matrices reaches the upper bound of 2^(n - 1).
%! sizes = 10:10:100;
%! growth = arrayfun(@high_growth_factor, sizes);
%!
%! assert(growth, arrayfun(@(n) 2^(n - 1), sizes));
