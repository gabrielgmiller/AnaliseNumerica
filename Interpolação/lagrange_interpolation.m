function y = lagrange_interpolation(x, x_points, y_points)
  n = length(x_points);
  y = 0;
  for i = 1:n
    L = 1;
    for j = [1:i-1, i+1:n]
      L = L * (x - x_points(j)) / (x_points(i) - x_points(j));
    end
    y = y + L * y_points(i);
  end
end

% Exemplo de uso:
% x_points = [1, 2, 4];
% y_points = [1, 4, 2];
% y = lagrange_interpolation(3, x_points, y_points);
% fprintf('Interpolação de Lagrange em x=3: %f\n', y);

