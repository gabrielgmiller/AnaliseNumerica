function coeffs = regressao_polinomial(x, y, grau)
  if nargin < 3
    grau = 2;
  end
  coeffs = polyfit(x, y, grau);
end

% Exemplo de uso:
% x = [1, 2, 3, 4, 5];
% y = [2, 4, 5, 4, 5];
% coeffs = regressao_polinomial(x, y, 2);
% fprintf('Coeficientes do polinômio: %f, %f, %f\n', coeffs);
% y_fit = polyval(coeffs, x);
% plot(x, y, 'o', x, y_fit, '-');

