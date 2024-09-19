function y = newton_interpolation(x, x_points, y_points)
  n = length(x_points);
  coef = y_points;

  for j = 2:n
    for i = n:-1:j
      coef(i) = (coef(i) - coef(i-1)) / (x_points(i) - x_points(i-j+1));
    end
  end

  y = coef(n);
  for i = n-1:-1:1
    y = y * (x - x_points(i)) + coef(i);
  end
end

% Exemplo de uso:
% x_points = [1, 2, 4];
% y_points = [1, 4, 2];
% y = newton_interpolation(3, x_points, y_points);
% fprintf('Interpolação de Newton em x=3: %f\n', y);

