function [raiz, iter] = cordas(f, x0, x1, tol, max_iter)
  if nargin < 5
    max_iter = 1000;
  end
  if nargin < 4
    tol = 1e-6;
  end

  iter = 0;
  while iter < max_iter
    fx0 = f(x0);
    fx1 = f(x1);

    if fx1 - fx0 == 0
      error('Divisão por zero no método das cordas.');
    end

    x2 = x1 - fx1 * (x1 - x0) / (fx1 - fx0);

    if abs(x2 - x1) < tol
      raiz = x2;
      return;
    end

    x0 = x1;
    x1 = x2;
    iter = iter + 1;
  end

  warning('Método das cordas não convergiu dentro do número máximo de iterações.');
  raiz = x1;
end

% Exemplo de uso:
% f = @(x) x^3 - x - 2;
% [raiz, iteracoes] = cordas(f, 1, 2, 1e-6);
% fprintf('Raiz: %f encontrada em %d iterações.\n', raiz, iteracoes);

