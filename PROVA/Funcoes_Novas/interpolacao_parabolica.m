function [a, b, c] = interpolacao_parabolica(x, y)
  %Lembrando que: y(x) = ax^2 + bx + c
  % Verifica se há exatamente 3 pontos
  if length(x) ~= 3 || length(y) ~= 3
    error('Devem ser fornecidos exatamente 3 pontos.');
  endif

  % Matriz do sistema linear para os coeficientes a, b e c
  A = [x(1)^2, x(1), 1;
       x(2)^2, x(2), 1;
       x(3)^2, x(3), 1];

  % Vetor dos valores de y correspondentes aos pontos
  B = [y(1); y(2); y(3)];

  % Resolve o sistema linear A * [a; b; c] = B
  coeficientes = A \ B;

  % Extraí os coeficientes a, b e c
  a = coeficientes(1);
  b = coeficientes(2);
  c = coeficientes(3);
endfunction
