function [t, y] = backward_euler(f, dfdy, t0, tf, y0, h)
  t = t0:h:tf;
  n = length(t);
  y = zeros(1, n);
  y(1) = y0;

  for i = 1:n-1
    % Resolver y_{i+1} = y_i + h * f(t_{i+1}, y_{i+1})
    % Usar Método de Newton-Raphson
    func = @(y_next) y_next - y(i) - h * f(t(i+1), y_next);
    dfunc = @(y_next) 1 - h * dfdy(t(i+1), y_next);
    y_next = newton_raphson(func, dfunc, y(i), 1e-6, 100);
    y(i+1) = y_next;
  end
end

% Exemplo de uso:
% f = @(t, y) -1000 * y + 3000 - 2000 * exp(-t);
% dfdy = @(t, y) -1000;
% [t, y] = backward_euler(f, dfdy, 0, 1, 0, 0.001);
% plot(t, y);
% xlabel('t');
% ylabel('y');
% title('Método de Euler Implícito');

