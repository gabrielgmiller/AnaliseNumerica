function exemplo_ajuste_curvas()
  x = [1, 2, 3, 4, 5];
  y = [2, 4, 5, 4, 5];

  % Regressão Linear
  [slope, intercept] = regressao_linear(x, y);
  fprintf('Regressão Linear - Slope: %f, Intercept: %f\n', slope, intercept);
  y_linear = slope * x + intercept;

  % Regressão Polinomial de 2º Grau
  coeffs = regressao_polinomial(x, y, 2);
  fprintf('Regressão Polinomial - Coeficientes: %f, %f, %f\n', coeffs);
  y_polinomial = polyval(coeffs, x);

  % Plotar os dados e os ajustes
  figure;
  plot(x, y, 'ko', 'MarkerFaceColor', 'k'); hold on;
  plot(x, y_linear, 'b-', 'LineWidth', 2);
  plot(x, y_polinomial, 'r--', 'LineWidth', 2);
  legend('Dados', 'Ajuste Linear', 'Ajuste Polinomial');
  xlabel('x');
  ylabel('y');
  title('Exemplo de Ajuste de Curvas');
  grid on;
end

% Exemplo de uso:
% exemplo_ajuste_curvas();

