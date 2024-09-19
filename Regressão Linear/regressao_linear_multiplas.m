function beta = regressao_linear_multiplas(X, y)
  % X: matriz de características (n x p)
  % y: vetor de respostas (n x 1)

  [n, p] = size(X);
  if length(y) ~= n
    error('O número de linhas de X deve ser igual ao tamanho de y.');
  end

  % Adicionar termo de intercepto
  X_aug = [ones(n,1), X];

  % Calcular beta usando mínimos quadrados
  beta = (X_aug' * X_aug) \ (X_aug' * y);
end

% Exemplo de uso:
% X = [1, 2; 2, 1; 3, 4; 4, 3];
% y = [3; 3; 7; 7];
% beta = regressao_linear_multiplas(X, y);
% fprintf('Intercept: %f, Coeficientes: [%f, %f]\n', beta(1), beta(2), beta(3));

