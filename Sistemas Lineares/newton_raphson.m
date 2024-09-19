function [raiz, iter] = newton_raphson(f, df, x0, tol, max_iter)
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
      error('Derivada zero encontrada no método de Newton-Raphson.');
    end

    x_new = x - fx / dfx;

    if abs(x_new - x) < tol
      raiz = x_new;
      return;
    end

    x = x_new;
    iter = iter + 1;
  end

  warning('Método de Newton-Raphson não convergiu dentro do número máximo de iterações.');
  raiz = x;
end

% Exemplo de uso:
% f = @(x) x^3 - x - 2;
% df = @(x) 3*x^2 - 1;
% [raiz, iteracoes] = newton_raphson(f, df, 1.5, 1e-6);
% fprintf('Raiz: %f encontrada em %d iterações.\n', raiz, iteracoes);

