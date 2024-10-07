function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
  y_interp = zeros(length(x_interp), 1);
  for i = 1:length(x_interp)
      stanga = 1;
      dreapta = rows(x) - 1;
      while stanga <= dreapta
         mid = floor((stanga + dreapta) / 2);
         if x(mid) <= x_interp(i) && x_interp(i) <= x(mid + 1)
             index = mid;
             break;
         elseif x_interp(i) < x(mid)
             dreapta = mid - 1;
         else
             stanga = mid + 1;
         end
      end

     my_a = coef(4 * (index - 1) + 1);
     my_b = coef(4 * (index - 1) + 2);
     my_c = coef(4 * (index - 1) + 3);
     my_d = coef(4 * (index - 1) + 4);

     diferenta = x_interp(i) - x(index);

     y_interp(i) = my_a + my_b * diferenta + my_c * diferenta * diferenta + my_d * diferenta .^ 3;
  endfor
end
