function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    l = rows(x) - 1;

    mat = zeros(l + 1, l + 1);
    b = zeros(l + 1, 1);

    mat(:, 1) = 1;
    for i = 1:l+1
      b(i) = y(i);
      for j = 2:l+1
        mat(i, j) = x(i) .^ (j - 1);
      endfor
    endfor
    coef = inv(mat) * b;
endfunction
