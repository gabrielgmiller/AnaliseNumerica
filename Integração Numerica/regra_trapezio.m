function integral = regra_trapezio(f, a, b, n)
  h = (b - a) / n;
  x = a:h:b;
  y = f(x);
  integral = (h / 2) * (y(1) + 2 * sum(y(2:end-1)) + y(end));
end

% Exemplo de uso:
% f = @(x) x.^2;
% integral = regra_trapezio(f, 0, 1, 100);
% fprintf('Integral aproximada: %f\n', integral);

