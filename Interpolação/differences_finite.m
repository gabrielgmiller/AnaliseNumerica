function y = differences_finite(x, x_points, y_points)
  n = length(x_points);
  F = zeros(n, n);
  F(:,1) = y_points';

  for j = 2:n
    for i = 1:n-j+1
      F(i,j) = (F(i+1,j-1) - F(i,j-1)) / (x_points(i+j-1) - x_points(i));
    end
  end

  coef = F(1, :);
  y = coef(n);
  for i = n-1:-1:1
    y = y * (x - x_points(i)) + coef(i);
  end
end

% Exemplo de uso:
% x_points = [1, 2, 4];
% y_points = [1, 4, 2];
% y = differences_finite(3, x_points, y_points);
% fprintf('Interpolação por Diferenças Finitas em x=3: %f\n', y);

