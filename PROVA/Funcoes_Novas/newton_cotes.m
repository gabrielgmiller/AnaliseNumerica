function [Integral, Info] = newton_cotes(a, b, n, m, f)
  % Lembrar de utilizar os coeficientes de cotes
  % a : limite inferior
  % b : limite superior
  % n : grau do polinômio
  % m : numero de subintervalos (Lembrar que o numero de subintervalos deve ser divisivel por n)
  % Saida:
  % Integral : valor da integral
  % Info: Informacao sobre consistencia, sendo:
  % Info = 0 -> sem erro
  % Info = -1 -> n<1 ou n>10
  % Info = -10 -> resto(m,n)~=0 ou m<0
  % Info = -11 -> ambas as condicoes ocorreram
  Integral = 0;
  Info = 0;
  % Coeficientes de Cotes
  [d,c,Info] = coeficientes_cotes(n);
  % Consistencia dos parametros
  if resto(m,n)~=0 || m<0
    Info = Info - 10;
  endif
  if Info~=0
    return;
  endif
  % Calculo da integral
  h = (b-a)/m;
  j = 0;
  for i = 0 : m
    x = a + i*h;
    y = f(x);
    j = j + 1;
    k = c(j);
    if resto(i,n) == 0 && i~=0 && i~=m
      k = k + k;
      j = 1;
    endif
    Integral = Integral + y*k;
  endfor
  Integral = n*h/d*Integral;
endfunction
