% Return a cell with the outputs of applying the passed-in function for each of the matrix sizes
function varargout = benchmark(matrix_sizes, fun)
    iteration_count = size(matrix_sizes, 2);
    output_count = nargout(fun);

    for i = 1:output_count
        varargout{i} = cell(1, iteration_count);
    end

    for iteration = 1:iteration_count
        output = nthargout(1:output_count, fun, matrix_sizes(iteration));

        for i = 1:output_count
            varargout{i}{iteration} = output{i};
        end
    end
end

% Return a vector with the output scalars for each matrix size for each argument
function varargout = benchmark_scalar(matrix_sizes, fun)
    output_count = nargout(fun);
    output = nthargout(1:output_count, @benchmark, matrix_sizes, fun);

    for i = 1:output_count
        varargout{i} = cell2mat(output{i});
    end
end
