function [t, y] = adams_bashforth(f, t0, tf, y0, h, ordem)
  if nargin < 6
    ordem = 2; % Ordem padrão
  end
  if ordem ~= 2
    error('Esta implementação é apenas para o método de Adams-Bashforth de 2ª ordem.');
  end

  t = t0:h:tf;
  n = length(t);
  y = zeros(1, n);
  y(1) = y0;

  % Usar RK4 para obter o segundo ponto
  [~, y_init] = runge_kutta4(f, t0, t0 + h, y0, h);
  y(2) = y_init(end);

  for i = 2:n-1
    y(i+1) = y(i) + h * (3/2 * f(t(i), y(i)) - 1/2 * f(t(i-1), y(i-1)));
  end
end

% Exemplo de uso:
% f = @(t, y) t + y;
% [t, y] = adams_bashforth(f, 0, 1, 1, 0.1, 2);
% plot(t, y, '-o');
% xlabel('t');
% ylabel('y');
% title('Método de Adams-Bashforth 2ª Ordem');

