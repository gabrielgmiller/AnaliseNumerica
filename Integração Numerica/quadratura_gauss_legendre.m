function integral = quadratura_gauss_legendre(f, a, b, n)
  [x, w] = gauss_legendre(n);
  % Mudança de variável de [a, b] para [-1, 1]
  t = ((b - a)/2)*x + (b + a)/2;
  integral = (b - a)/2 * sum(w .* f(t));
end

function [x, w] = gauss_legendre(n)
  % Obtém os pontos e pesos da quadratura de Gauss-Legendre
  % Fonte: https://www.mathworks.com/matlabcentral/fileexchange/27473-gauss-legendre-quadrature
  % Aqui implementamos uma função simplificada

  [x, w] = lgwt(n, -1, 1);
end

function [x, w] = lgwt(N, a, b)
  % Obtém os pontos e pesos de Gauss-Legendre usando a biblioteca existente ou implementando
  % Implementação simplificada
  beta = 0.5 ./ sqrt(1 - (2*(1:N-1) -1).^(-2));
  T = diag(beta,1) + diag(beta,-1);
  [V,D] = eig(T);
  [x, idx] = sort(diag(D));
  w = 2 * V(1, idx).^2;
  x = a + (x + 1)*(b - a)/2;
  w = w*(b - a)/2;
end

% Exemplo de uso:
% f = @(x) x.^2;
% integral = quadratura_gauss_legendre(f, 0, 1, 3);
% fprintf('Integral aproximada: %f\n', integral);

