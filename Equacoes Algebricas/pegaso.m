function [raiz, iter] = pegaso(f, df, x0, tol, max_iter)
  % Nota: O método de Pégaso não é amplamente padronizado.
  % Aqui, implementaremos uma variante que adapta o passo baseado na derivada.
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
      error('Derivada zero encontrada no método de Pégaso.');
    end

    % Ajuste do passo
    delta = fx / dfx;
    x_new = x - delta / (1 + abs(delta));

    if abs(x_new - x) < tol
      raiz = x_new;
      return;
    end

    x = x_new;
    iter = iter + 1;
  end

  warning('Método de Pégaso não convergiu dentro do número máximo de iterações.');
  raiz = x;
end

% Exemplo de uso:
% f = @(x) x^3 - x - 2;
% df = @(x) 3*x^2 - 1;
% [raiz, iteracoes] = pegaso(f, df, 1.5, 1e-6);
% fprintf('Raiz: %f encontrada em %d iterações.\n', raiz, iteracoes);

