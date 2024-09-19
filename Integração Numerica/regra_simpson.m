function integral = regra_simpson(f, a, b, n)
  if mod(n, 2) ~= 0
    error('n deve ser par para a regra de Simpson.');
  end

  h = (b - a) / n;
  x = a:h:b;
  y = f(x);

  integral = (h / 3) * (y(1) + 4 * sum(y(2:2:end-1)) + 2 * sum(y(3:2:end-2)) + y(end));
end

% Exemplo de uso:
% f = @(x) x.^2;
% integral = regra_simpson(f, 0, 1, 100);
% fprintf('Integral aproximada: %f\n', integral);

