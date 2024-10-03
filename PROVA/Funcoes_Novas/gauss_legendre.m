function [Integ, Info] = gauss_legendre(a, b, n, f)
  % Lembrar de usar gauss_legendre_abspes
  % Ser usado pelo gauss_legendre_iterativo
  % a : limite inferior do intervalo
  % b : limite superior do intervalo
  % n : numero de pontos
  % f : funcao a ser integrada
  % Calculo das abscissas e pesos
  [T, W, Info] = gauss_legendre_abspes(n);
  if Info ~= 0 % n < 1 ou zeros nao convergiram
    return;
  endif
  % Calculo da integral
  Integ = 0;
  Info = 0;
  ba2 = (b-a)/2;
  for i = 1 : n
    x = a + ba2 * (T(i)+1);
    y = f(x); % Avaliar a funcao integrando em x
    Integ = Integ + y * W(i);
  endfor
  Integ = ba2 * Integ;
endfunction
