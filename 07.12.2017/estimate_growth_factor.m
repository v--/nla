% We do not use the custom lu_decompose function because it is not stable enough for this test

function[growth] = growth_factor(A)
    [L, U] = lu(A);
    growth = max(max(abs(U))) / max(max(abs(A)));
end

function[growth] = estimate_growth_factor(n)
    % Get the maximal growth factor of five random matrices
    growth = max(arrayfun(@() growth_factor(rand(n)), 1:5));
end

%!test
%! source 07.12.2017/estimate_growth_factor.m;
%!
%! % Verify that the growth factor is always at most 2^(n - 1).
%! sizes = 10:10:100;
%! growth = arrayfun(@estimate_growth_factor, sizes);
%!
%! assert(growth <= arrayfun(@(n) 2^(n - 1), sizes));
