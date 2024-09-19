function integral = quadratura_newton_cotes(f, a, b, n, tipo)
  % tipo: 'trapézio', 'simpson1', 'simpson2'
  if nargin < 5
    tipo = 'trapézio';
  end

  h = (b - a) / n;
  x = a:h:b;
  y = f(x);

  switch tipo
    case 'trapézio'
      integral = (h / 2) * (y(1) + 2 * sum(y(2:end-1)) + y(end));
    case 'simpson1'
      if mod(n, 2) ~= 0
        error('n deve ser par para a regra de Simpson 1ª ordem.');
      end
      integral = (h / 3) * (y(1) + 4 * sum(y(2:2:end-1)) + 2 * sum(y(3:2:end-2)) + y(end));
    case 'simpson2'
      if mod(n, 2) ~= 0
        error('n deve ser par para a regra de Simpson 2ª ordem.');
      end
      integral = (h / 3) * (y(1) + 4 * sum(y(2:2:end-1)) + 2 * sum(y(3:2:end-2)) + y(end));
    otherwise
      error('Tipo de quadratura desconhecido.');
  end
end

% Exemplo de uso:
% f = @(x) x.^2;
% integral_trap = quadratura_newton_cotes(f, 0, 1, 100, 'trapézio');
% integral_simpson1 = quadratura_newton_cotes(f, 0, 1, 100, 'simpson1');
% fprintf('Integral Trapézio: %f\n', integral_trap);
% fprintf('Integral Simpson 1ª Ordem: %f\n', integral_simpson1);

