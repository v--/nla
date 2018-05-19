function[growth] = growth_factor(A)
    [L, U] = lu(A);
    growth = max(max(abs(U))) / max(max(abs(A)));
end
