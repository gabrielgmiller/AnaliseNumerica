function [raiz, iter] = iteracao_linear(g, x0, tol, max_iter)
  if nargin < 4
    max_iter = 1000;
  end
  if nargin < 3
    tol = 1e-6;
  end

  iter = 0;
  x = x0;

  while iter < max_iter
    x_new = g(x);

    if abs(x_new - x) < tol
      raiz = x_new;
      return;
    end

    x = x_new;
    iter = iter + 1;
  end

  warning('Método de Iteração Linear não convergiu dentro do número máximo de iterações.');
  raiz = x;
end

% Exemplo de uso:
% Para a equação x = cos(x), g(x) = cos(x)
% g = @(x) cos(x);
% [raiz, iteracoes] = iteracao_linear(g, 0.5, 1e-6);
% fprintf('Raiz: %f encontrada em %d iterações.\n', raiz, iteracoes);

