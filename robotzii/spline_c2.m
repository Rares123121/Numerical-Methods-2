function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)
  intervale = rows(x) - 1;

	% TOOD 1: si(xi) = yi, i = 0 : n - 1
  mat = zeros(intervale * 4, intervale * 4);
  b = zeros(intervale * 4, 1);

  for i = 1:intervale
    b(i) = y(i);
    mat(i, (i - 1) * 4 + 1) = 1;
  endfor

	% TODO 2: s_n-1(xn) = yn
  mat(intervale + 1, (intervale - 1) * 4 + 1) = 1;
  b(intervale + 1) = y(intervale + 1);
  putere = 1;
  for i = ((intervale - 1) * 4 + 2):intervale * 4
    mat(intervale + 1, i) = (x(intervale + 1) - x(intervale)) .^ putere;
    putere = putere + 1;
  endfor

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
    k = 2;
    for i = 1:(intervale - 1)
      dif = x(i + 1) - x(i);
      mat(i * 3 + intervale - 1, (4*(i-1) + 1):(4 * k)) = [1 dif dif*dif dif .^ 3 -1 0 0 0];
      mat(i * 3 + intervale, 4*(i-1) + 1:4 * k) = [0 1 2*dif 3 * dif *dif 0 -1 0 0];
      mat(i* 3 + intervale + 1, 4*(i-1) + 1:4 * k) = [0 0 2 6 * dif 0 0 -2 0];
      k = k + 1;
    endfor

   mat(intervale + 1 + 3 * (intervale - 1) + 1, 1:4) = [0 0 2 0];
   dif2 = x(intervale + 1) - x(intervale);
   mat(intervale + 1 + 3 * (intervale - 1) + 2, 4 * (intervale - 1) + 1:4 * intervale) = [0 0 2 6 * dif2];

	% TODO 6: s0''(x0) = 0

	% TODO 7: s_n-1''(x_n) = 0
  coef = inv(mat) * b;
	% Solve the system of equations
end
