function [slope, intercept] = regressao_linear(x, y)
  n = length(x);
  if length(y) ~= n
    error('Os vetores x e y devem ter o mesmo tamanho.');
  end

  X = [ones(n,1), x(:)];
  beta = X \ y(:);

  intercept = beta(1);
  slope = beta(2);
end

% Exemplo de uso:
% x = [1, 2, 3, 4, 5];
% y = [2, 4, 5, 4, 5];
% [slope, intercept] = regressao_linear(x, y);
% fprintf('Slope: %f, Intercept: %f\n', slope, intercept);

