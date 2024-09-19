function [t, y] = series_taylor(f, df, t0, tf, y0, h, ordem)
  if nargin < 7
    ordem = 2;
  end
  t = t0:h:tf;
  n = length(t);
  y = zeros(1, n);
  y(1) = y0;

  for i = 1:n-1
    y_next = y(i);
    for k = 1:ordem
      y_next = y_next + (h^k / factorial(k)) * kth_derivative(f, df, t(i), y(i), k);
    end
    y(i+1) = y_next;
  end
end

function yk = kth_derivative(f, df, t, y, k)
  % Função auxiliar para calcular a k-ésima derivada
  % Nesta implementação simplificada, assumimos que as derivadas são conhecidas
  % Para EDOs mais complexas, é necessário definir explicitamente as derivadas
  switch k
    case 1
      yk = f(t, y);
    otherwise
      error('Derivadas de ordem superior não implementadas.');
  end
end

% Exemplo de uso:
% f = @(t, y) t + y; % dy/dt = t + y
% df = @(t, y) 1 + f(t, y); % d²y/dt² = 1 + dy/dt = 1 + t + y
% [t, y] = series_taylor(f, df, 0, 1, 1, 0.1, 2);
% plot(t, y, '-o');
% xlabel('t');
% ylabel('y');
% title('Método de Séries de Taylor (Ordem 2)');

