function Integral = um_terco_de_simpson(a, b, n, f)
  % a : limite inferior
  % b : limite superior
  % n : limite de subintervalos
  % f : funcao a ser integrada
  h = (b-a)/(2*n);
  x = a:h:b;
  soma = 0;
  y = f(x);
  for i = 1 : n
    soma = soma + y(2*i-1) + 4*y(2*i) + y(2*i+1);
  endfor
  Integral = (h/3)*soma;
endfunction
