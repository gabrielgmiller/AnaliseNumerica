function [t, y] = euler_melhorado(f, t0, tf, y0, h)
  t = t0:h:tf;
  n = length(t);
  y = zeros(1, n);
  y(1) = y0;

  for i = 1:n-1
    y_pred = y(i) + h * f(t(i), y(i));
    y(i+1) = y(i) + h * f(t(i+1), y_pred);
  end
end

% Exemplo de uso:
% f = @(t, y) t + y;
% [t, y] = euler_melhorado(f, 0, 1, 1, 0.1);
% plot(t, y, '-o');
% xlabel('t');
% ylabel('y');
% title('Método de Euler Melhorado');

