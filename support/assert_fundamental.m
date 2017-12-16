function[result] = assert_fundamental(vector)
    n = length(vector);
    diff = abs(vector(1, 2:n) - vector(1, 1:n - 1));
    assert(diff(2:n - 1) < diff(1:n - 2), 'Not a fundamental sequence');
end
