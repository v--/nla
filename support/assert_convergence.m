function[result] = assert_fundamental(vector)
    n = size(vector, 2);
    diff = abs(vector(1, 2:n) - vector(1, 1:n - 1));
    assert(diff(2:n - 1) < diff(1:n - 2), sprintf('Not a fundamental sequence'))
end
