addpath('support')

addpath('12.10.2017')
test 12.10.2017/gauss;

addpath('19.10.2017')
test 19.10.2017/gauss_with_pivoting;
test 19.10.2017/lu_decompose;
test 19.10.2017/lu_solve;

addpath('09.11.2017')
test 09.11.2017/benchmark_gauss;
test 09.11.2017/cholesky;
test 09.11.2017/cholesky_solve;

addpath('16.11.2017')
test 16.11.2017/gauss_tridiagonal;
test 16.11.2017/benchmark_gauss_tridiagonal;

addpath('23.11.2017')
test 23.11.2017/approx_cond;

addpath('30.11.2017')
test 30.11.2017/approx_hilbert_matrix_cond;
test 30.11.2017/estimate_hilbert_matrix_error;
test 30.11.2017/estimate_cond;

addpath('07.12.2017')
test 07.12.2017/estimate_growth_factor;
test 07.12.2017/high_growth_factor;

addpath('14.12.2017')
test 14.12.2017/jacobi_iteration;
test 14.12.2017/seidel_iteration;

addpath('21.12.2017')
test 21.12.2017/benchmark_seidel;

addpath('11.01.2018')
test 11.01.2018/ls_cholesky;
test 11.01.2018/ls_qr;
test 11.01.2018/benchmark_ls;

addpath('18.01.2018')
test 18.01.2018/jacobi_eigenvalues;
