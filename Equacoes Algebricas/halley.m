function [raiz, iter] = halley(f, df, ddf, x0, tol, max_iter)
  if nargin < 6
    max_iter = 1000;
  end
  if nargin < 5
    tol = 1e-6;
  end

  iter = 0;
  x = x0;

  while iter < max_iter
    fx = f(x);
    dfx = df(x);
    ddfx = ddf(x);

    denominator = 2*(dfx)^2 - fx*ddfx;
    if denominator == 0
      error('Denominador zero no método de Halley.');
    end

    x_new = x - (2*fx*dfx) / denominator;

    if abs(x_new - x) < tol
      raiz = x_new;
      return;
    end

    x = x_new;
    iter = iter + 1;
  end

  warning('Método de Halley não convergiu dentro do número máximo de iterações.');
  raiz = x;
end

% Exemplo de uso:
% f = @(x) x^3 - x - 2;
% df = @(x) 3*x^2 - 1;
% ddf = @(x) 6*x;
% [raiz, iteracoes] = halley(f, df, ddf, 1.5, 1e-6);
% fprintf('Raiz: %f encontrada em %d iterações.\n', raiz, iteracoes);

