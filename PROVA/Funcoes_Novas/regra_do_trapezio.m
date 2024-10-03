function Integral = regra_do_trapezio(a, b, n, f)
  % a : limite inferior do intervalo
  % b : limite superior do intervalo
  % n : numero de pontos
  % f : funcao a ser integrada com a regra do trapezio
  h = (b-a)/n;
  x = a:h:b;
  y = f(x);
  soma = 0;
  for i = 1 : n
    soma = soma + y(i) + y(i+1);
  endfor
  Integral = (h/2)*soma;
endfunction
