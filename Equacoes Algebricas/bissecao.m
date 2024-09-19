function [raiz, iter] = bissecao(f, a, b, tol, max_iter)
  if nargin < 5
    max_iter = 1000;
  end
  if nargin < 4
    tol = 1e-6;
  end

  fa = f(a);
  fb = f(b);

  if fa * fb >= 0
    error('O método da bisseção não é aplicável: f(a) * f(b) >= 0.');
  end

  iter = 0;
  while (b - a)/2 > tol && iter < max_iter
    c = (a + b)/2;
    fc = f(c);

    if fc == 0
      raiz = c;
      return;
    elseif fa * fc < 0
      b = c;
      fb = fc;
    else
      a = c;
      fa = fc;
    end
    iter = iter + 1;
  end
  raiz = (a + b)/2;

  if iter == max_iter
    warning('Método da bisseção não convergiu dentro do número máximo de iterações.');
  end
end

% Exemplo de uso:
% f = @(x) x^3 - x - 2;
% [raiz, iteracoes] = bissecao(f, 1, 2, 1e-6);
% fprintf('Raiz: %f encontrada em %d iterações.\n', raiz, iteracoes);

