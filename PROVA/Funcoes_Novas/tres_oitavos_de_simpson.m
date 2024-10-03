function Integral = tres_oitavos_de_simpson(a, b, n, f)
  % a : limite inferior
  % b : limite superior
  % n : limite de subintervalos
  % f : funcao a ser integrada
  h = (b-a)/(3*n);
  x = a:h:b;
  soma = 0;
  y = f(x);
  for i = 1 : n
    soma = soma + y(3*i-2) + 3*y(3*i-1) + 3*y(3*i) + y(3*i+1);
  endfor
  Integral = (3*h/8)*soma;
endfunction
