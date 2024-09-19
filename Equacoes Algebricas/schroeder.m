function [raiz, iter] = schroeder(f, df, x0, tol, max_iter)
  % Implementação simplificada do método de Schröeder
  if nargin < 5
    max_iter = 1000;
  end
  if nargin < 4
    tol = 1e-6;
  end

  iter = 0;
  x = x0;

  while iter < max_iter
    fx = f(x);
    dfx = df(x);

    if dfx == 0
      error('Derivada zero encontrada no método de Schröeder.');
    end

    % Taxa de convergência (beta) pode ser ajustada
    beta = 1.0; % Pode ser ajustado para melhorar a convergência
    x_new = x - beta * fx / dfx;

    if abs(x_new - x) < tol
      raiz = x_new;
      return;
    end

    x = x_new;
    iter = iter + 1;
  end

  warning('Método de Schröeder não convergiu dentro do número máximo de iterações.');
  raiz = x;
end

% Exemplo de uso:
% f = @(x) x^3 - x - 2;
% df = @(x) 3*x^2 - 1;
% [raiz, iteracoes] = schroeder(f, df, 1.5, 1e-6);
% fprintf('Raiz: %f encontrada em %d iterações.\n', raiz, iteracoes);

