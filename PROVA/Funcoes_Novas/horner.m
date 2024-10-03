function y = horner(n, c, a)
  % Lembrar de usar com o metodo de fourier
  % n : grau
  % c : coeficientes, P(x) = c(1)*x^n + c(2)*x^n-1 + ... + c(n)*x + c(n+1)
  % a : abscissa onde será avaliado
  % Saida:
  % Ordanada P(a)
  y = c(1);
  for i = 2 : n + 1
    y = y*a + c(i);
  endfor
endfunction
