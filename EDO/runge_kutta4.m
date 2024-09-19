function [t, y] = runge_kutta4(f, t0, tf, y0, h)
  t = t0:h:tf;
  n = length(t);
  y = zeros(1, n);
  y(1) = y0;

  for i = 1:n-1
    k1 = f(t(i), y(i));
    k2 = f(t(i) + h/2, y(i) + h * k1 / 2);
    k3 = f(t(i) + h/2, y(i) + h * k2 / 2);
    k4 = f(t(i) + h, y(i) + h * k3);
    y(i+1) = y(i) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
  end
end

% Exemplo de uso:
% f = @(t, y) t + y;
% [t, y] = runge_kutta4(f, 0, 1, 1, 0.1);
% plot(t, y, '-o');
% xlabel('t');
% ylabel('y');
% title('Método de Runge-Kutta 4ª Ordem');

