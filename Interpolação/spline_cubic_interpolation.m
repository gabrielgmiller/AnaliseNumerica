function y = spline_cubic_interpolation(x, x_points, y_points)
  pp = spline(x_points, y_points);
  y = ppval(pp, x);
end

% Exemplo de uso:
% x_points = [1, 2, 3, 4];
% y_points = [1, 4, 9, 16];
% y = spline_cubic_interpolation(2.5, x_points, y_points);
% fprintf('Spline Cúbica em x=2.5: %f\n', y);

